import 'package:flutter/material.dart';
import 'package:projeto_base/app/core/internacionalization/app_translate.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(child: Text(AppTranslate(context).text("welcome"))),
    );
  }
}