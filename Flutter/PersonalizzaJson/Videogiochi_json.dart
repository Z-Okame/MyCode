import 'dart:convert';

Map<String, String> gioco = {
  "Titolo": "Pragmata",
  "CasaDiSviluppo": "Capcom",
  "Anno": "2026",
};

String giocoJson = '''{
  "Titolo": "Crimson Desert",
  "CasaDiSviluppo": "Pearl Abyss",
	"Anno": "2026"
  }''';


String giochiJson = '''
[
  {
    "Titolo": "Baldur’s Gate 3 ",
    "CasaDiSviluppo": "Larian Studios",
	  "Anno": "2023"
  },
  {
    "Titolo": "The Legend of Zelda: Tears of the Kingdom",
    "CasaDiSviluppo": "Ninendo",
	  "Anno": "2023"
  },
  {
    "Titolo": "It Takes Two",
    "CasaDiSviluppo": "EA, Hazelight Studios",
	  "Anno": "2021"
  }
]''';

class Videogioco {
  final String titolo;
  final String casaDiSviluppo;
  final String anno;

  Videogioco(this.titolo, this.casaDiSviluppo, this.anno);

  Videogioco.fromJson(Map<String, dynamic> json)
      : titolo = json['Titolo'],
        casaDiSviluppo = json['CasaDiSviluppo'],
        anno = json['Anno'];
}


class ListaGiochi {
  final List<Videogioco> listaGiochi;

  ListaGiochi({required this.listaGiochi});

  //costruttore factory
  factory ListaGiochi.fromJson(List<dynamic> parsedJson) {
  
  List<Videogioco> listaGiochi = parsedJson.map((gioco) => Videogioco.fromJson(gioco)).toList();
  return ListaGiochi(
    listaGiochi : listaGiochi,
  );
}
}

main() {
  print("\n\nStampa direttamente dal tipo Map");
  print("${gioco['Titolo']}, ${gioco['CasaDiSviluppo']}, ${gioco['Anno']}");

  print("\n\nTrasforma in Map da stringa json");
  Map<String, dynamic> giocoMap =jsonDecode(giocoJson);
  print("${giocoMap['Titolo']}, ${giocoMap['CasaDiSviluppo']}, ${giocoMap['Anno']}");

  print("\n\nTrasforma in classe Videogioco da Map");
  var giocoClasse = Videogioco.fromJson(giocoMap);
  print('${giocoClasse.titolo}, ${giocoClasse.casaDiSviluppo}, ${giocoClasse.anno}');

  print("\n\nTrasforma in lista di classe Videogioco da stringa json");

  List<dynamic> giochiMap = jsonDecode(giochiJson);
  List<Videogioco> giochi = ListaGiochi.fromJson(giochiMap).listaGiochi;

  giochi.forEach(
      (gioco) => print('${gioco.titolo}, ${gioco.casaDiSviluppo}, ${gioco.anno}'));
}