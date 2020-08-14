import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_base/app/app_controller.dart';
import 'package:projeto_base/app/app_widget.dart';
import 'package:projeto_base/app/modules/home/home_module.dart';
import 'package:projeto_base/app/modules/splash/splash_page.dart';

class AppModule extends MainModule {

  // Faz a injeção de dependencias
  @override
  List<Bind> get binds => [
    Bind(
      (i) => AppController()
    )
  ];

  // Primeira aplicação que sera iniciada (app_widget)
  @override
  Widget get bootstrap => AppWidget();

  // Rotas nomeadas
  @override
  List<Router> get routers => [
    Router(
      "/", 
      child: (_, args) => SplashPage(),
      transition: TransitionType.noTransition,
    ),
    Router(
      "/home",
      module: HomeModule()
    )
  ];
}