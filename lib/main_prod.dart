import 'package:flutter/material.dart';
import 'package:places/config/dependency_injection.dart';
import 'package:places/config/env.dart';
import 'package:places/features/places/presentation/screens/permission_page/permission_page.dart';
import 'app_env.dart';
import 'features/places/presentation/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Env.mode = EnvMode.production;

  await setupDi();

  runApp(AppEnv(
    child: PlacesApp(),
    initRoute: PermissionPage.name,
  ));
}
