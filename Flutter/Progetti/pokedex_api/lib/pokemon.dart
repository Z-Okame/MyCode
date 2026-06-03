class Pokemon {
  final int id;
  final String nome;
  final List<String> tipi;
  final String spriteUrl;
  final String versoUrl;
  final String spriteShinyUrl;
  final String spriteAnimatoUrl;

  Pokemon({
    required this.id,
    required this.nome,
    required this.tipi,
    required this.spriteUrl,
    required this.versoUrl,
    required this.spriteShinyUrl,
    required this.spriteAnimatoUrl,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      nome: json['name'],
      tipi: json['types'].length > 1
          ? [json['types'][0]['type']['name'], json['types'][1]['type']['name']]
          : [json['types'][0]['type']['name']],
      spriteUrl: json['sprites']['front_default'],
      versoUrl: json['cries']['latest'],
      spriteAnimatoUrl:
          json['sprites']['versions']['generation-v']['black-white']['animated']['front_default'],
      spriteShinyUrl:
          json['sprites']['versions']['generation-v']['black-white']['animated']['front_shiny'],
    );
  }
}
