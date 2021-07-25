import 'dart:io';

String fixture(String name) => File('assets/datasample/$name').readAsStringSync();
