import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fun_cam/camera_app/presentation/pages/camera_page.dart';
import 'package:fun_cam/camera_app/presentation/pages/camera_page.dart';
import 'package:fun_cam/core/utils/app_constant.dart';

import 'core/services/service_locator.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstant.appName,
      theme: ThemeData(useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home:  const CameraPage(),
    );
  }
}


