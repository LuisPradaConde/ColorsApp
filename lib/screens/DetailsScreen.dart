
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practica2/providers/provider.dart';
import 'package:provider/provider.dart';



class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ThemeData localTheme = Theme.of(context);

    Size size = MediaQuery.of(context).size;
    final _provider = Provider.of<MyProvider>(context);
    String background = "";
    String foreground = "";
    String image = "";

    List<String> request_parameters = [
      'b',
      'closest_palette_color',
      'closest_palette_color_html_code',
      'closest_palette_color_parent',
      'closest_palette_distance',
      'g',
      'html_code',
      'percent',
      'r'
    ];

    for (int i = 0; i < _provider.getRes.background_colors.length; i++) {
      for (int j = 0; j < request_parameters.length; j++) {
        background += request_parameters[j] + ':' + '  ' +
            _provider.getRes.background_colors[i][request_parameters[j]].toString() + '\n';
      }
      background += '\n';
    }

    for (int i = 0; i < _provider.getRes.foreground_colors.length; i++) {
      for (int j = 0; j < request_parameters.length; j++) {
        foreground += request_parameters[j] + ':' + '  ' +
            _provider.getRes.foreground_colors[i][request_parameters[j]].toString() + '\n';
      }
      foreground += '\n';
    }

    for (int i = 0; i < _provider.getRes.image_colors.length; i++) {
      for (int j = 0; j < request_parameters.length; j++) {
        image += request_parameters[j] + ':' + '  ' +
            _provider.getRes.image_colors[i][request_parameters[j]].toString() + '\n';
      }
      image += '\n';
    }

    return new MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text('Details', style: localTheme.textTheme.headline6),),
        body: SingleChildScrollView(
          child: Flexible(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  Container(
                      child: new Column( //Background Colors
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                               Container(
                                margin: EdgeInsets.only(left: 10, top: 10),
                                child: Text("BackgroundColors: ", style: localTheme.textTheme.headline5
                              ),
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 10.0, top: 10),
                                child: Flexible(
                                child : Text(background, style: localTheme.textTheme.subtitle2.copyWith(color: localTheme.primaryColorLight)
                                ),),
                              ),
                          ]
                      )
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 10, left: 10),
                      child: new Row(
                          children: <Widget>[
                            Text("Color Variance : ", style: localTheme.textTheme.headline5
                              ),
                            Flexible(
                            child : Text(_provider.getRes.color_variance.toString(),
                                style: localTheme.textTheme.subtitle2.copyWith(color: localTheme.primaryColorLight)
                              ),),
                          ]
                      )
                  ),
                  Container(
                      margin: EdgeInsets.all(10),
                      child: new Row(
                          children: <Widget>[
                            Text("Color Percent : ", style: localTheme.textTheme.headline5),

                            Flexible(
                              child : Text(_provider.getRes.color_percent_threshold.toString(),
                                  style: localTheme.textTheme.subtitle2.copyWith(color: localTheme.primaryColorLight)
                              ),),
                          ]
                      )
                  ),
                  Container(
                      child: new Column( //Background Colors
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text("ForegroundColors: ",style: localTheme.textTheme.headline5

                              ),
                              ),

                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Flexible(
                                child: Text(foreground
                                , style: localTheme.textTheme.subtitle2.copyWith(color: localTheme.primaryColorLight)
                                ),),
                              ),
                          ]
                      )
                  ),
                  Container(
                      child: new Column( //Background Colors
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                              Container(
                                margin: EdgeInsets.only(top: 10, left: 10),
                                child: Text("Image Colors :", style: localTheme.textTheme.headline5
                                ),
                            ),

                            Container(
                                margin: EdgeInsets.all(10),
                                child: Flexible(
                                  child: Text(image
                                  ,style: localTheme.textTheme.subtitle2.copyWith(color: localTheme.primaryColorLight)
                                ),),
                            ),
                          ]
                      )
                  ),
                   Container(
                      margin: EdgeInsets.all(10.0),
                      child: new Row(
                          children: <Widget>[
                            Text("Object Percentage : ", style: localTheme.textTheme.headline5),

                            Flexible(
                            child: Text(_provider.getRes.object_percentage.toString(),
                                style: localTheme.textTheme.subtitle2.copyWith(color: localTheme.primaryColorLight)
                              ),),
                          ]
                      )
                  ),

              ],),
          ),
        )
    ),);
  }
}