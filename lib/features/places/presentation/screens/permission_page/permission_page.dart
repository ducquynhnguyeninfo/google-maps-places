import 'package:flutter/material.dart';
import 'package:places/config/dependency_injection.dart';
import 'package:places/features/places/presentation/screens/places_list/home_page.dart';
import 'package:places/utils/location_helper.dart';

class PermissionPage extends StatefulWidget {
  static const String name = "permission_page";

  const PermissionPage({Key? key}) : super(key: key);

  @override
  _PermissionPageState createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {

  @override
  void initState() {
    super.initState();
    sl<LocationHelper>().myPosition(requestNew: true).then(
            (value) {
          Navigator.pushReplacementNamed(context, HomePage.name);
        }, onError: (error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Whizz Places App')),
      body: Center(
        child: Column(
          children: [
            Text(
                "Please allow the app to use Location Service on this device."),
            TextButton(
                onPressed: () {
                  sl<LocationHelper>().myPosition(requestNew: true).then(
                      (value) {
                    Navigator.pushReplacementNamed(context, HomePage.name);
                  }, onError: (error) {});
                },
                child: Text("Grant Location Permission"))
          ],
        ),
      ),
    );
  }
}
