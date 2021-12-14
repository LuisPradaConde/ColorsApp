import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:practica2/providers/provider.dart';
import 'package:practica2/screens/TakePictureScreen.dart';
import 'package:provider/provider.dart';

class ProviderApp extends StatelessWidget {

 final List<CameraDescription> cameras ;
 const ProviderApp({Key key, @required this.cameras});


  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_)=> MyProvider(),
      child: MaterialApp(
          theme: ThemeData.dark(),
          home: TakePictureScreen(
            camera: cameras.first,
          ),
      ),
    );
  }

}