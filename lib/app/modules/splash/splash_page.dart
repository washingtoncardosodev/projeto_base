import 'package:flutter/material.dart';
import '../../../app/core/features/localization/app_translate.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(AppTranslate(context).text("welcome"))),
    );
  }
}