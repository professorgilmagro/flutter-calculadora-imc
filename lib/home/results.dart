import 'package:calculadora_imc/Calculator.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as math;

class ResultsDisplay {
  double imc;
  String info;
  ImcTypes type;
  BuildContext context;

  ResultsDisplay(this.context, this.imc, this.info, this.type);

  Animation getAnimation() {
    return CurvedAnimation(
      curve: Curves.easeInOutCubic,
      parent: null,
    ).drive(Tween(begin: 0, end: 2));
  }

  Image getIcon() {
    String icon;

    switch (type) {
      case ImcTypes.below:
        icon = 'fit';
        break;

      case ImcTypes.normal:
        icon = 'normal';
        break;

      case ImcTypes.light:
        icon = 'fat';
        break;

      case ImcTypes.high:
        icon = 'fat1';
        break;

      case ImcTypes.severe:
        icon = 'fat2';
        break;

      case ImcTypes.morbid:
        icon = 'fat3';
        break;

      default:
        icon = 'normal';
    }

    String asset = "assets/images/$icon.png";
    return Image.asset(asset, height: 120, color: Colors.white);
  }

  void show() async {
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      pageBuilder: (context, a1, a2) {},
      barrierColor: Colors.black.withOpacity(0.4),
      barrierLabel: '',
      transitionDuration: Duration(milliseconds: 300),
      transitionBuilder: (context, a1, a2, child) {
        return Transform.rotate(
            angle: math.radians(a1.value * 360),
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                backgroundColor: Colors.purple,
                scrollable: true,
                content: SingleChildScrollView(
                  child: ListBody(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                        child: getIcon()),
                    Text('I M C',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Text(imc.toStringAsPrecision(4),
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 60,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                    ),
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          border: Border.all(
                            color: Colors.purpleAccent,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(40.0))),
                      child: Text(info,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                    ),
                  ]),
                ),
                actions: <Widget>[
                  RaisedButton(
                    color: Colors.purpleAccent,
                    child: Text('Ok', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ));
      },
    );
  }
}
