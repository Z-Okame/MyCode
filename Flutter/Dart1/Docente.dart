import 'Dipendente.dart';

class Docente extends Dipendente {
  int _numeroOre;

  //Costruttore con parametri nominali
  Docente(this._numeroOre, {String nominativo = "", String sesso = "", String dataDiNascita = "00-00-0000", double stipendioBase = 0.0}) 
  : super(nominativo: nominativo, sesso: sesso, dataDiNascita: dataDiNascita, stipendioBase: stipendioBase);

  //Getter
  int get numeroOre => _numeroOre;

  //Metodi
  
  @override
  String toString() {
    return super.toString() + ", Numero Ore: $_numeroOre";
  }

  double calcolaStipendio() {
    return this.stipendioBase * this._numeroOre;
  }
}