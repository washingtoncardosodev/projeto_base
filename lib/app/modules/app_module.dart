import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_base/app/interfaces/shared_repository_interface.dart';
import 'package:projeto_base/app/repositories/shared_repository.dart';
import 'package:projeto_base/app/views/pages/splash/splash_page.dart';
import '../controllers/app_controller.dart';
import '../views/pages/main/app_widget.dart';
import 'home_module.dart';

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