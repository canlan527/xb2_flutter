import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:xb2_flutter/app/app.dart';

void main(List<String> args) async {
  await dotenv.load(fileName: '.env');
  runApp(App());
}