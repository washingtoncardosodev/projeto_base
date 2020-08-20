
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'core/interfaces/shared_repository_interface.dart';
import 'core/repositories/shared_repository.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_page.dart';


class AppModule extends MainModule {

  // Faz a injeção de dependencias
  @override
  List<Bind> get binds => [
    Bind<ISharedRepositoryInterface>(
      (i) => SharedRepository(),
    ),
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