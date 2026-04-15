import 'Dipendente.dart';

class Impiegato extends Dipendente {
  String _livello;

  //Costruttore con parametri nominali
  Impiegato(this._livello, {String nominativo = "", String sesso = "", String dataDiNascita = "00-00-0000", double stipendioBase = 0.0}) 
  : super(nominativo: nominativo, sesso: sesso, dataDiNascita: dataDiNascita, stipendioBase: stipendioBase);

  //Getter
  String get livello => _livello;

  //Metodi
  
  @override
  String toString() {
    return super.toString() + ", Livello: " + this._livello;
  }

  double calcolaStipendio() {
    return this.stipendioBase * 12;
  }
}