import 'package:flutter/material.dart';
import 'package:places/features/places/presentation/routes.dart';
import 'package:places/features/places/presentation/screens/permission_page/permission_page.dart';
import 'package:places/values/app_colors.dart';

class PlacesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places App',
      theme: ThemeData(
        primarySwatch: AppColors.backgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      home: PermissionPage(),
      onGenerateRoute: (settings) => onGenerateRoute(settings),
    );
  }
}
