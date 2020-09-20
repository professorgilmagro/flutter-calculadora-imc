import 'dart:math';

enum ImcTypes { below, normal, light, high, severe, morbid }

class Calculator {
  double weight;
  double height;

  Calculator(this.weight, this.height);

  double getIMC() => this.weight / pow(this.height / 100, 2);

  ImcTypes getResult() {
    double imc = getIMC();

    if (imc < 18.5) {
      return ImcTypes.below;
    }

    if (imc > 18.5 && imc <= 24.9) {
      return ImcTypes.normal;
    }

    if (imc > 24.9 && imc <= 29.9) {
      return ImcTypes.light;
    }

    if (imc > 29.9 && imc <= 34.9) {
      return ImcTypes.high;
    }

    if (imc > 34.9 && imc <= 39.9) {
      return ImcTypes.severe;
    }

    return ImcTypes.morbid;
  }

  String getResultInfo() {
    var result = this.getResult();

    if (result == ImcTypes.below) {
      return 'Abaixo do peso';
    }

    if (result == ImcTypes.normal) {
      return 'Peso ideal (Parabéns)';
    }

    if (result == ImcTypes.light) {
      return 'Levemente acima do peso';
    }

    if (result == ImcTypes.high) {
      return 'Obesidade grau I';
    }

    if (result == ImcTypes.severe) {
      return 'Obesidade grau II (severa)';
    }

    return 'Obesidade grau III (mórbida)';
  }
}
