import 'package:flutter/material.dart';
import 'package:places/features/places/presentation/screens/places_list/home_page.dart';

class PlacesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'Whizz Places App'),
    );
  }
}
