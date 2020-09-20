import 'package:calculadora_imc/Calculator.dart';
import 'package:calculadora_imc/home/results.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _resultInfo = "";
  double _result;

  void _resetFields() {
    this.weightController.text = "";
    this.heightController.text = "";

    setState(() {
      this._resultInfo = 'Informe o peso e a altura e clique em calcular';
      this._formKey.currentState.reset();
    });
  }

  void calculateIMC() {
    // if (_formKey.currentState.validate() == false) {
    //   return;
    // }

    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text);
      Calculator calc = Calculator(weight, height);
      this._result = calc.getIMC();
      this._resultInfo =
          "IMC ${_result.toStringAsPrecision(2)} ${calc.getResultInfo()}";
      ResultsDisplay(
              context, calc.getIMC(), calc.getResultInfo(), calc.getResult())
          .show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculador de IMC"),
          centerTitle: true,
          backgroundColor: Colors.purple,
          actions: [
            IconButton(icon: Icon(Icons.autorenew), onPressed: _resetFields)
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 120,
                      color: Colors.purple,
                    ),
                    TextFormField(
                        controller: this.weightController,
                        validator: (value) {
                          return value.isEmpty ? "Informe seu peso" : "";
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.purple, fontSize: 30),
                        decoration: InputDecoration(
                            labelText: "Peso (Kg)",
                            labelStyle: TextStyle(color: Colors.purple))),
                    TextFormField(
                        controller: this.heightController,
                        validator: (value) {
                          return value.isEmpty ? "Informe sua altura" : "";
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.purple, fontSize: 30),
                        decoration: InputDecoration(
                            labelText: "Altura (cm)",
                            labelStyle: TextStyle(color: Colors.purple))),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Container(
                            height: 50,
                            child: RaisedButton(
                              color: Colors.purple,
                              onPressed: calculateIMC,
                              child: Text(
                                "Calcular",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ))),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Text(this._resultInfo,
                            style:
                                TextStyle(color: Colors.purple, fontSize: 18),
                            textAlign: TextAlign.center))
                  ])),
        ));
  }
}
