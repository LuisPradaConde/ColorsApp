import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:practica2/providers/provider.dart';

import 'package:practica2/screens/PetitionScreen.dart';
import 'package:provider/provider.dart';

Future<JsonResponse> updateFile(File image) async  {
  var stream = new http.ByteStream(DelegatingStream.typed((image.openRead())));
  var length = await(image.length());
  Map <String, String> headers = {
    "Accept": "application/json",
    "Authorization": "Basic YWNjXzcxOWNhYzJlNmYyZDNiODo2NDE5MmJjOGJkYjA0NDZmOTU3ZmQ1OGM5Zjk0NDc5YQ==",
  };

  var postUri = Uri.parse("https://api.imagga.com/v2/colors?image_url=");
  var request = new http.MultipartRequest("POST", postUri);
  request.headers.addAll(headers);
  request.fields['Authorization'] =
  "Basic YWNjXzcxOWNhYzJlNmYyZDNiODo2NDE5MmJjOGJkYjA0NDZmOTU3ZmQ1OGM5Zjk0NDc5YQ==";
  var multipartFileString = new http.MultipartFile(
      'image',
      stream,
      length,
      filename: basename((image.path)));
  request.files.add(multipartFileString);

  var response = await request.send();
  if (response.statusCode != HttpStatus.OK) {
    throw 'Error getting IP address:\nHttp status ${response.statusCode}';
  }

  String r = await response.stream.transform(utf8.decoder).join();
  Map res = json.decode(r);
  JsonResponse result = JsonResponse.fromJson(res['result']['colors']);
  return result;
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {

  Widget build(BuildContext context) {

    ThemeData localTheme = Theme.of(context);
    final _provider = Provider.of<MyProvider> (context);
    return MaterialApp(
      theme: ThemeData.dark(),
    home : Scaffold(
      backgroundColor: Color(000000),
      appBar: AppBar(title: Text('Display the Picture',style: localTheme.textTheme.headline6),),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(_provider.getPhoto)),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.menu),
        backgroundColor: localTheme.floatingActionButtonTheme.backgroundColor,
        foregroundColor: localTheme.floatingActionButtonTheme.foregroundColor,
        elevation: localTheme.floatingActionButtonTheme.elevation,
        label: Text('SEE PHOTO DETAILS'),
        onPressed: () async {
          _provider.setRes(await updateFile(File(_provider.getPhoto)));
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PetitionScreen(),
            ),
          );
        },
      ),
    ),);
  }
}