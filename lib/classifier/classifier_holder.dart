import 'package:anemia_project_app/classifier/classifier.dart';
import 'package:anemia_project_app/classifier/classifier_float.dart';

class ClassifierHolder {
  static final Classifier _classifier = ClassifierFloat();

  static Classifier getClassifier() {
    return _classifier;
  }
}
