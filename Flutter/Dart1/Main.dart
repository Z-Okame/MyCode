import 'Docente.dart';
import 'Impiegato.dart';
import 'ImpiegatoConStraordinari.dart';

void main() {
  Docente docente = Docente(160, nominativo: "Mario", sesso: "M", dataDiNascita: "01-01-1980", stipendioBase: 25.0);
  Impiegato impiegato = Impiegato("Impiegato", nominativo: "Luigi", sesso: "M", dataDiNascita: "02-02-1985", stipendioBase: 20000.0);
  ImpiegatoConStraordinari impiegatoConStraordinari = ImpiegatoConStraordinari(10, sesso: "M", nominativo: "Giovanni", dataDiNascita: "03-03-1990", stipendioBase: 22000.0, livello: "Impiegato con Straordinari");

  print(docente);
    print(impiegato);
    print(impiegatoConStraordinari);

  print("Stipendio Docente: ${docente.calcolaStipendio()}");
  print("Stipendio Impiegato: ${impiegato.calcolaStipendio()}");
  print("Stipendio Impiegato con Straordinari: ${impiegatoConStraordinari.calcolaStipendio()}");
}
