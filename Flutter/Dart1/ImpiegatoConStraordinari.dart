import 'Impiegato.dart';

class ImpiegatoConStraordinari extends Impiegato {
  int _numeroStraordinari;
  final int _retribuzioneStraordinari = 20;

  //Costruttore con parametri nominali
  ImpiegatoConStraordinari(this._numeroStraordinari, {String nominativo = "", String sesso = "", String dataDiNascita = "00-00-0000", double stipendioBase = 0.0, String livello = ""}) 
  : super(livello, nominativo: nominativo, sesso: sesso, dataDiNascita: dataDiNascita, stipendioBase: stipendioBase);

  //Getter
  int get numeroStraordinari => _numeroStraordinari;

  //Metodi

  @override
  String toString() {
    return super.toString() + ", Numero Straordinari: ${_numeroStraordinari}";
  }

  double calcolaStipendio() {
    return this.stipendioBase * 12 + this._numeroStraordinari * this._retribuzioneStraordinari;
  }
}