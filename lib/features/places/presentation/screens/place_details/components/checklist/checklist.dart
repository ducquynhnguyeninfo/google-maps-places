import 'package:flutter/material.dart';

class Checklist extends StatefulWidget {
  const Checklist({Key? key}) : super(key: key);

  @override
  _ChecklistState createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
            value: true, title: Text('Is floor clean?'), onChanged: (value) {}),
        CheckboxListTile(
            value: true, title: Text('Is floor clean?'), onChanged: (value) {}),
        CheckboxListTile(
            value: true, title: Text('Is floor clean?'), onChanged: (value) {}),
        CheckboxListTile(
            value: true, title: Text('Is floor clean?'), onChanged: (value) {}),
      ],
    );
  }
}
