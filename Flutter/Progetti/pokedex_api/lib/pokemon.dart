class Pokemon {
  final int id;
  final String nome;
  final String tipo;
  final String spriteUrl;
  final String versoUrl;

  Pokemon({
    required this.id,
    required this.nome,
    required this.tipo,
    required this.spriteUrl,
    required this.versoUrl,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id:        json['id'],
      nome:      json['name'],
      tipo:      json['types'][0]['type']['name'],
      spriteUrl: json['sprites']['front_default'],
      versoUrl:  json['cries']['latest'],
    );
  }
}