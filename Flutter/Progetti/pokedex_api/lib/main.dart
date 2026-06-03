import 'package:flutter/material.dart';
import 'pokemon.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Elenco Pokémon')),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Pokemon>>(
              future: futuriPokemon,
              builder: (context, snapshot) {
                // bottone non ancora premuto
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

                final pokemon = snapshot.data!;

                return ListView.builder(
                  itemCount: pokemon.length,
                  itemBuilder: (context, index) {
                    final p = pokemon[index];
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        leading: Image.network(p.spriteUrl),
                        title: Text(p.nome),
                        onTap: () => showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text(p.nome),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network(p.spriteAnimatoUrl),
                                Text(p.tipi.join(' / ')),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                futuriPokemon = fetchPokemon();
              });
            },
            child: const Text('Carica Pokémon'),
          ),
        ],
      ),
    );
  }
}
