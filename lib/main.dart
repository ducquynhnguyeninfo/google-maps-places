import 'package:flutter/material.dart';
import 'package:places/config/dependency_injection.dart';
import 'features/places/presentation/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDi();

  runApp(PlacesApp());
}
