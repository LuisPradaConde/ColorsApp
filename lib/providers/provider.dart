
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


class JsonResponse {

  final List <dynamic> background_colors;
  final double color_percent_threshold;
  final int color_variance;
  final List <dynamic> foreground_colors;
  final List <dynamic> image_colors;
  final double object_percentage;

  JsonResponse({this.background_colors, this.color_percent_threshold,
    this.color_variance, this.foreground_colors, this.image_colors, this.object_percentage});


  factory JsonResponse.fromJson(Map<String, dynamic> json){

    return JsonResponse(
        background_colors: json['background_colors'],
        color_percent_threshold: json['color_percent_threshold'],
        color_variance: json['color_variance'],
        foreground_colors: json['foreground_colors'],
        image_colors: json['image_colors'],
        object_percentage: json['object_percentage']
    );
  }
}

class MyProvider with ChangeNotifier {

  JsonResponse _res;
  String _photo;

  JsonResponse get  getRes => _res;
  String get  getPhoto =>_photo;

  void setRes(JsonResponse value) {
    _res = value;
    notifyListeners();
  }

  void setPhoto(String path) {
    _photo = path;
  notifyListeners();}
}
