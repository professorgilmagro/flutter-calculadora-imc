import 'package:calculadora_imc/Calculator.dart';
import 'package:flutter/material.dart';

class ResultsDisplay {
  double imc;
  String info;
  ImcTypes type;
  BuildContext context;

  ResultsDisplay(this.context, this.imc, this.info, this.type);

  Icon getIcon() {
    IconData icon;

    switch (type) {
      case ImcTypes.below:
        icon = Icons.fastfood;
        break;

      case ImcTypes.normal:
        icon = Icons.insert_emoticon;
        break;

      case ImcTypes.light:
        icon = Icons.accessibility_new;
        break;

      case ImcTypes.high:
        icon = Icons.fitness_center;
        break;

      case ImcTypes.severe:
      case ImcTypes.morbid:
        icon = Icons.local_hospital;
        break;

      default:
        icon = Icons.info_outline;
    }

    return Icon(icon, size: 100, color: Colors.white);
  }

  void show() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.purple,
          scrollable: true,
          content: SingleChildScrollView(
            child: ListBody(children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 20), child: getIcon()),
              Text('I M C',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Text(imc.toStringAsPrecision(2).toString(),
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
                    borderRadius: BorderRadius.all(Radius.circular(40.0))),
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
        );
      },
    );
  }
}
