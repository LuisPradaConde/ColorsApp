
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:practica2/providers/provider.dart';
import 'package:practica2/screens/DetailsScreen.dart';
import 'package:provider/provider.dart';


extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

class PetitionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;

    bool vertical = (MediaQuery.of(context).orientation.index == Orientation.portrait.index);

    final margenIconoImage = vertical?3.2*pixelRatio :8* pixelRatio;
    final alto5 = vertical?size.height/8:size.height/5;
    final alto3 = vertical?size.height/8:size.height/3;
    final margenIcono= vertical?8 * pixelRatio:12 * pixelRatio;

    final _provider = Provider.of<MyProvider>(context);
    ThemeData localTheme = Theme.of(context);

    return new MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text('Photo Information', style: localTheme.textTheme.headline6),
          ),
        ),
        body: SingleChildScrollView(
          child: Flexible(
            child: Container(
                  width: size.width,
                child: Column (
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget>[
                  SizedBox(height: 16.0),
                    //Image Colors
                    Container (
                      color: localTheme.cardColor,
                      width: size.width - 30,
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.fromLTRB(0, pixelRatio * 5, 0, pixelRatio * 10),
                      child: Column (
                          children: <Widget>[
                            Container(alignment: Alignment.topLeft,
                              padding:  EdgeInsets.fromLTRB(4 * pixelRatio, 2  * pixelRatio, 2 * pixelRatio,4* pixelRatio),
                              child:FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text('Image Colors: ', style: localTheme.textTheme.headline4,
                                ),
                              ),
                              ),
                            Container(alignment: Alignment.topLeft,
                              padding:  EdgeInsets.fromLTRB(4 * pixelRatio, 2  * pixelRatio, 2 * pixelRatio,4* pixelRatio),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(" Colores que aparecen en toda la imagen ", style: localTheme.textTheme.subtitle1.copyWith(fontStyle: FontStyle.italic,),
                              ),
                            ),
                            ),
                            Container(
                              width: size.width,
                              child: Row(
                                mainAxisAlignment: vertical?MainAxisAlignment.center:MainAxisAlignment.start,
                                children : <Widget>[
                                  for (int i = 0;i<_provider.getRes.image_colors.length;i++)
                                    Flexible(
                                    child:Container(
                                      width: size.width,
                                      height: alto5,
                                      margin: EdgeInsets.symmetric(horizontal:size.width * 0.01),
                                      child: Center(
                                          child: FittedBox(
                                            fit:BoxFit.scaleDown,
                                              child:
                                              Text(_provider.getRes.image_colors[i]['percent'].toStringAsFixed(2) + '%',
                                              textAlign: TextAlign.center,
                                              style: localTheme.textTheme.bodyText1,
                                      ),),
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black, width: 1),
                                        shape: BoxShape.circle,
                                        color: _provider.getRes.image_colors[i]['closest_palette_color_html_code'].toString().toColor(),
                                      ),
                                    ),
                                    ),
                                ],
                              ),
                            ),
                      ],
                      ),
                    ),
                    SizedBox(height: 8.0),
                    //Foreground Colors
                    Container (
                      color: localTheme.cardColor,
                      //height: size.height/2,
                      width: size.width - 30,
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(0, pixelRatio * 5, 0, pixelRatio * 10),
                      child: Column (
                          children: <Widget>[
                            Container(alignment: Alignment.topLeft,
                              padding:  EdgeInsets.fromLTRB(4 * pixelRatio, 2  * pixelRatio, 2 * pixelRatio,4* pixelRatio),
                              child:FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text('Foreground Colors: ', style: localTheme.textTheme.headline4,
                                ),
                                ),
                              ),

                            Container(alignment: Alignment.topLeft,
                              padding:  EdgeInsets.fromLTRB(4 * pixelRatio, 2  * pixelRatio, 2 * pixelRatio,4* pixelRatio),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(" Colores que aparecen en el primer plano de la imagen ", style: localTheme.textTheme.subtitle1.copyWith(fontStyle: FontStyle.italic)
                                ),
                                ),
                              ),

                            Container(
                              width: size.width,
                              child: Row(
                                mainAxisAlignment: vertical?MainAxisAlignment.center:MainAxisAlignment.start,
                                children : <Widget>[
                                  for (int i = 0;i<_provider.getRes.foreground_colors.length;i++)
                                    Flexible(
                                      child : Container(
                                        margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                                        height: alto3,
                                        width: size.width,
                                        child: Center(
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(_provider.getRes.foreground_colors[i]['percent'].toStringAsFixed(2) + '%',
                                              textAlign: TextAlign.center,
                                              style:  localTheme.textTheme.bodyText1,
                                              ),
                                            ),
                                        ),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black, width: 2),
                                        shape: BoxShape.circle,
                                        color: _provider.getRes.foreground_colors[i]['closest_palette_color_html_code'].toString().toColor(),
                                      ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                      ),
                    ),
                    SizedBox(height: 8.0),
                    //Background Colors
                    Container (
                      color: localTheme.cardColor,

                      width: size.width - 30,
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(0, pixelRatio * 5, 0, pixelRatio * 10),
                      child: Column (
                          children: <Widget>[
                            Container(alignment: Alignment.topLeft,
                              padding:  EdgeInsets.fromLTRB(4 * pixelRatio, 2  * pixelRatio, 2 * pixelRatio,4* pixelRatio),
                              child:FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text('Background Colors: ', style: localTheme.textTheme.headline4,

                                ),
                                ),
                              ),
                            Container(alignment: Alignment.topLeft,
                                padding:  EdgeInsets.fromLTRB(4 * pixelRatio, 2  * pixelRatio, 2 * pixelRatio,4* pixelRatio),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(" Colores que aparecen en fondo de la imagen ", style: localTheme.textTheme.subtitle1.copyWith(fontStyle: FontStyle.italic)
                                ),
                                ),
                              ),
                            Container(
                              width: size.width ,
                              child: Row(
                                mainAxisAlignment: vertical?MainAxisAlignment.center:MainAxisAlignment.start,
                                children : <Widget>[
                                  for (int i = 0;i<_provider.getRes.background_colors.length;i++)
                                    Flexible(
                                    child:Container(
                                      margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                                      height: alto3,
                                      width: size.width,
                                      child: Center(
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(_provider.getRes.background_colors[i]['percent'].toStringAsFixed(2) + '%',
                                            textAlign: TextAlign.center,
                                            style: localTheme.textTheme.bodyText1,
                                            ),
                                          ),
                                        ),

                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black, width: 2),
                                        shape: BoxShape.circle,
                                        color: _provider.getRes.background_colors[i]['closest_palette_color_html_code'].toString().toColor(),
                                      ),
                                    ),
                                    ),
                                ],
                              ),
                            ),
                          ]
                      ),
                  ),
                    SizedBox(height: 8.0),
                  ],
                ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.menu),
          backgroundColor: localTheme.floatingActionButtonTheme.backgroundColor,
          foregroundColor: localTheme.floatingActionButtonTheme.foregroundColor,
          elevation: localTheme.floatingActionButtonTheme.elevation,
          label: Text('MORE DETAILS'),

          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}