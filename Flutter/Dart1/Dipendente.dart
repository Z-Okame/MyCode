class Dipendente {
  String _nominativo;
  String _sesso;
  String _dataDiNascita;
  double _stipendioBase;

  //Costruttore con parametri nominali
  Dipendente({String nominativo = "", String sesso = "", String dataDiNascita = "00-00-0000", double stipendioBase = 0.0})
  : _nominativo = nominativo,
    _sesso = sesso,
    _dataDiNascita = dataDiNascita,
    _stipendioBase = stipendioBase;

  //Getters
  String get nominativo => _nominativo;
  String get sesso => _sesso;
  String get dataDiNascita => _dataDiNascita;
  double get stipendioBase => _stipendioBase;

  //Metodo
  String toString() {
    return "Dipendente: ${_nominativo}, Sesso: ${_sesso}, Data di Nascita: ${_dataDiNascita}, Stipendio Base: ${_stipendioBase}";
  }
}