import 'package:flutter/material.dart';
import 'package:flutter_auth/src/config/app/custom_colors.dart';
import 'package:flutter_auth/src/config/parser/parser_config.dart';
import 'package:flutter_auth/src/screens/login_screen/login_screen.dart';
import 'package:flutter_auth/src/stores/sign_up_store/sign_up_store.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

void main() async {
  await DotEnv().load('.env');
  await ParserConfig.initializeParser();
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton<SignUpStore>(SignUpStore());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: CustomColors.primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: CustomColors.primaryColor,
          appBarTheme: AppBarTheme(
            color: CustomColors.primaryColor,
            elevation: 0,
          )),
      home: LoginScreen(),
    );
  }
}
