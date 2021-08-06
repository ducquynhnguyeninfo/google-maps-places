import 'package:flutter/material.dart';
import 'package:places/app_env.dart';
import 'package:places/config/env.dart';
import 'package:places/features/places/presentation/routes.dart';
import 'package:places/values/app_colors.dart';

class PlacesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var config = AppEnv.of(context)!; // assume it not null

    print("api_key ${Env.get('api_key')}");

    return MaterialApp(
      title: 'Places App',
      theme: ThemeData(
        primarySwatch: AppColors.mainColor,
      ),
      debugShowCheckedModeBanner: false,
      // home: PermissionPage(),
      initialRoute: config.initRoute,
      onGenerateRoute: (settings) => onGenerateRoute(settings),
    );
  }
}
