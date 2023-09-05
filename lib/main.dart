import 'package:anemia_project_app/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:anemia_project_app/SplashScreen.dart';
import 'package:anemia_project_app/OnboardingScreen.dart';
import 'package:anemia_project_app/RegistrationScreen.dart';
import 'package:anemia_project_app/Home.dart';
import 'package:anemia_project_app/Login.dart';
import 'package:anemia_project_app/Profile.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        // theme: ThemeData(
        //   colorScheme: ThemeData().colorScheme.copyWith(
        //     primary: primaryColour,
        //   ),
        // ),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          OnboardingScreen.id: (context) => OnboardingScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          NotificationScreen.id: (context) => NotificationScreen(),
          Home.id: (context) => Home(),
          ProfileScreen.id: (context) => ProfileScreen(),
        });
  }
}
