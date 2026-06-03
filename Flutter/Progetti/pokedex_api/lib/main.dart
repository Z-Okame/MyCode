import 'package:flutter/material.dart';
import 'pokemon.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';

final audioPlayer = AudioPlayer();

Future<List<Pokemon>> fetchPokemon() async {
  try {
    final listaRes = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=649'),
      headers: {'Accept': 'application/json'},
    );

    if (listaRes.statusCode == 200) {
      final results = jsonDecode(listaRes.body)['results'] as List;

      final lista = await Future.wait(
        results.map((item) async {
          final res = await http.get(Uri.parse(item['url'] as String));
          return Pokemon.fromJson(jsonDecode(res.body));
        }),
      );

      return lista;
    } else {
      throw Exception(
        'Errore HTTP ${listaRes.statusCode}: ${listaRes.reasonPhrase}',
      );
    }
  } catch (e) {
    throw Exception('Errore di rete/parsing: $e');
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      theme: ThemeData(useMaterial3: true),
      home: const PaginaPokemon(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PaginaPokemon extends StatefulWidget {
  const PaginaPokemon({super.key});

  @override
  State<PaginaPokemon> createState() => _PaginaPokemonState();
}

class _PaginaPokemonState extends State<PaginaPokemon> {
  Future<List<Pokemon>>? futuriPokemon;
  String _ricerca = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokédex')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: SearchBar(
              hintText: 'Cerca Pokémon...',
              leading: const Icon(Icons.search),
              onChanged: (valore) {
                setState(() {
                  _ricerca = valore.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Pokemon>>(
              future: futuriPokemon,
              builder: (context, snapshot) {
                if (futuriPokemon == null) {
                  return const Center(
                    child: Text('Premi il bottone per caricare i Pokémon'),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Errore: ${snapshot.error}'));
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Nessun Pokémon trovato'));
                }

                final pokemonFiltrati = snapshot.data!
                    .where((p) => p.nome.toLowerCase().contains(_ricerca))
                    .toList();

                return ListView.builder(
                  itemCount: pokemonFiltrati.length,
                  itemBuilder: (context, index) {
                    final p = pokemonFiltrati[index];
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        leading: Image.network(p.spriteUrl),
                        title: Text(p.nome),
                        onTap: () => showDialog(
                          context: context,
                          builder: (_) => PokemonDialog(pokemon: p),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  futuriPokemon = fetchPokemon();
                });
              },
              child: const Text('Carica Pokémon'),
            ),
          ),
        ],
      ),
    );
  }
}

class PokemonDialog extends StatefulWidget {
  final Pokemon pokemon;
  const PokemonDialog({super.key, required this.pokemon});

  @override
  State<PokemonDialog> createState() => _PokemonDialogState();
}

class _PokemonDialogState extends State<PokemonDialog> {
  bool _isShiny = false;
  String _descrizione = '';
  String _tipoIta = '';

  @override
  void initState() {
    super.initState();
    _fetchDescrizione();
    _fetchTipo();
  }

  Future<void> _fetchDescrizione() async {
    final res = await http.get(
      Uri.parse(
        'https://pokeapi.co/api/v2/pokemon-species/${widget.pokemon.id}',
      ),
    );
    final data = jsonDecode(res.body);
    final voci = data['flavor_text_entries'] as List;
    final ita = voci.firstWhere(
      (e) => e['language']['name'] == 'it',
      orElse: () => voci.firstWhere((e) => e['language']['name'] == 'en'),
    );
    setState(() {
      _descrizione = (ita['flavor_text'] as String);
    });
  }

  Future<void> _fetchTipo() async {
    final nomiIta = await Future.wait(
      widget.pokemon.tipi.map((tipo) async {
        final res = await http.get(
          Uri.parse('https://pokeapi.co/api/v2/type/$tipo'),
        );
        final data = jsonDecode(res.body);
        final nomi = data['names'] as List;
        final ita = nomi.firstWhere(
          (e) => e['language']['name'] == 'it',
          orElse: () => {'name': tipo},
        );
        return ita['name'] as String;
      }),
    );
    setState(() => _tipoIta = nomiIta.join(' / '));
  }

  Future<void> _riproduciVerso() async {
    await audioPlayer.play(UrlSource(widget.pokemon.versoUrl));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.pokemon.nome + ' (#${widget.pokemon.id})'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                _isShiny
                    ? widget.pokemon.spriteShinyUrl
                    : widget.pokemon.spriteAnimatoUrl,
                width: 120,
                height: 120,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  _descrizione.isEmpty ? 'Caricamento...' : _descrizione,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(_tipoIta.isEmpty ? 'Caricamento...' : _tipoIta),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => setState(() => _isShiny = !_isShiny),
                child: Text(_isShiny ? 'Normale' : 'Shiny ✨'),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: _riproduciVerso,
                  child: const Text('🔊'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
