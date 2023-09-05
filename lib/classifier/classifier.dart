import 'package:image/image.dart';
import 'package:collection/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tflite_flutter_plus/tflite_flutter_plus.dart';
import 'package:tflite_flutter_helper_plus/tflite_flutter_helper_plus.dart';



abstract class Classifier {
  late Interpreter interpreter;
  late InterpreterOptions _interpreterOptions;

  late List<int> _inputShape;
  late List<int> _outputShape;

  late TensorImage _inputImage;
  late TensorBuffer _outputBuffer;

  late TfLiteType _inputType;
  late TfLiteType _outputType;

  final String _labelsFileName = './assets/labels.txt';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final int _labelsLength = 2;

  late var _probabilityProcessor;

  late List<String> labels;

  late String predictedClass;
  late double accuracy;

  String get modelName;

  NormalizeOp get preProcessNormalizeOp;
  NormalizeOp get postProcessNormalizeOp;

  Classifier({int? numThreads}) {
    _interpreterOptions = InterpreterOptions();

    if (numThreads != null) {
      _interpreterOptions.threads = numThreads;
    }

    loadModel();
    loadLabels();
  }

  Future<void> loadModel() async {
    try {
      interpreter =
      await Interpreter.fromAsset(modelName, options: _interpreterOptions);
      print('Interpreter Created Successfully');

      _inputShape = interpreter.getInputTensor(0).shape;
      // _outputShape = interpreter.getOutputTensor(0).shape;
      _inputType = interpreter.getInputTensor(0).type;
      interpreter = await Interpreter.fromAsset(modelName, options: _interpreterOptions);
      interpreter.allocateTensors();
      var outputDetails = interpreter.getOutputTensors();
      _outputShape = outputDetails[0].shape.toList();

      _outputType = interpreter.getOutputTensor(0).type;

      _outputBuffer = TensorBuffer.createFixedSize(_outputShape, _outputType);
      _probabilityProcessor =
          TensorProcessorBuilder().add(postProcessNormalizeOp).build();
    } catch (e) {
      print('Unable to create interpreter, Caught Exception: ${e.toString()}');
    }
  }

  Future<void> loadLabels() async {
    labels = await FileUtil.loadLabels(_labelsFileName);
    print("labels.length= ${labels.length}");
    print("labelsLength= $_labelsLength");
    print("labels ${labels.first}");
    if (labels.length == _labelsLength) {
      print('Labels loaded successfully');
    } else {
      print('Unable to load labels');
    }
  }

  TensorImage _preProcess() {
    int cropSize = 150;
    return ImageProcessorBuilder()
        .add(ResizeWithCropOrPadOp(cropSize, cropSize))
        .add(ResizeOp(
        _inputShape[1], _inputShape[2], ResizeMethod.nearestneighbour))
        .add(preProcessNormalizeOp)
        .build()
        .process(_inputImage);
  }

  Future<Object> predict(Image image) async {
    final pres = DateTime.now().millisecondsSinceEpoch;
    _inputImage = TensorImage(_inputType);
    _inputImage.loadImage(image);
    _inputImage = _preProcess();
    final pre = DateTime.now().millisecondsSinceEpoch - pres;

    print('Time to load image: $pre ms');

    final runs = DateTime.now().millisecondsSinceEpoch;
    interpreter.run(_inputImage.buffer, _outputBuffer.getBuffer());
    print('Output shape: $_outputShape');
    print('Labels length: ${labels.length}');

    final run = DateTime.now().millisecondsSinceEpoch - runs;

    print('Time to run inference: $run ms');

    final outputValues = _outputBuffer.getDoubleList();
    final prediction = outputValues[0]; // Get the single prediction value

    print('Prediction: $prediction');
    if(prediction > 0.5)
      return Category(labels[1], prediction); // Return the predicted class and its probability
    else
      return Category(labels[0], prediction); // Return the predicted class and its probability

  }


  int getElementSizeInBytes(TfLiteType type) {
    switch (type) {
      case TfLiteType.float32:
        return 4;
      case TfLiteType.int32:
        return 4;
      case TfLiteType.uint8:
        return 1;
      default:
        throw ArgumentError('Unsupported TfLiteType: $type');
    }
  }


  Future<Object> predictForMultipleInputs(Image image) async {
    final pres = DateTime.now().millisecondsSinceEpoch;
    _inputImage = TensorImage(_inputType);
    _inputImage.loadImage(image);
    _inputImage = _preProcess();
    final pre = DateTime.now().millisecondsSinceEpoch - pres;

    print('Time to load image: $pre ms');

    final runs = DateTime.now().millisecondsSinceEpoch;
    var inputs = [_inputImage.buffer];
    var outputBuffer = TensorBuffer.createDynamic(TfLiteType.float32);
    var outputs = <int, TensorBuffer>{0: outputBuffer};
    interpreter.runForMultipleInputs(inputs, outputs);
    print('Output shape: $_outputShape');
    print('Labels length: ${labels.length}');

    final run = DateTime.now().millisecondsSinceEpoch - runs;

    print('Time to run inference: $run ms');

    double labeledProb;
    if (outputBuffer.getShape().length > 1) {
      labeledProb = TensorLabel.fromList(
        labels,
        _probabilityProcessor.process(outputBuffer),
      )
          .getMapWithFloatValue()
          .values
          .first;
    } else {
      labeledProb = 0.0;
    }

    if (labeledProb > 0) {
      predictedClass = labels[1];
    } else {
      predictedClass = labels[0];
    }

    return Category(predictedClass, labeledProb);
  }


  void close() {
    interpreter.close();
  }
}

