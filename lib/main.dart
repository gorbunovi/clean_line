
import 'package:clean_line/fealure/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'servise_locator.dart' as di;

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}


