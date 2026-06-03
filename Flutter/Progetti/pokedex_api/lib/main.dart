/*
Progetto finale in Flutter creato da Gizzi Manuel
Pokédex dalla I a V generazione Pokémon che mostra descrizione (in italiano),tipo (in italiano), sprite 2D, sprite Shiny e sprite 3D 
e consente di riprodurre il verso del pokémon
fa utilizzo dell'API PokeAPI: https://pokeapi.co/
*/
import 'package:flutter/material.dart';
import 'pokemon.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart'; //per riprodurre il verso del pokémon

final audioPlayer = AudioPlayer();

/*
Funzione che elabora i  dati dei Pokémon
ritorna una lista di oggetti Pokemon
contrassegnata come Future per via dell'elaborazione dei dati nel tempo
*/
Future<List<Pokemon>> fetchPokemon() async {
  try {
    //Richiesta dei dati dei Pokémon, qui andiamo soltanto a ottenere i file di ogni pokémon
    final listaRes = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=649'),
      headers: {'Accept': 'application/json'},
    );

    if (listaRes.statusCode == 200) {
      //Prendiamo la lista di risultati ottenuti
      final results = jsonDecode(listaRes.body)['results'] as List;

      //Per ogni risultato otteniamo l'url (il JSON) con tutti i dettagli del pokémon, che poi
      //inseriremo all'interno di ognuna delle 649 istanze
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

                //Lista dei pokemon poi mostrati a schermo, filtrata in caso di ricerca
                final pokemonFiltrati = snapshot.data!
                    .where((p) => p.nome.toLowerCase().contains(_ricerca))
                    .toList();

                //Lista visualizzata a schermo contentente per ciascuna Card:
                //Immagine, nome del Pokémon e possibilità di cliccarci per mostrare a schermo le specifiche
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
            //Tasto per il fetch dei Pokémon
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

//Widget che mostra le specifiche dei Pokémon
class PokemonDialog extends StatefulWidget {
  final Pokemon pokemon;
  const PokemonDialog({super.key, required this.pokemon});

  @override
  State<PokemonDialog> createState() => _PokemonDialogState();
}

class _PokemonDialogState extends State<PokemonDialog> {
  int _spriteStato = 0; // 0 = normale, 1 = shiny, 2 = 3D
  String _descrizione = '';
  String _tipoIta = '';

  //Switch case per mostrare i vari tipi di sprite
  String get _spriteCorrente {
    switch (_spriteStato) {
      case 1:
        return widget.pokemon.spriteShinyUrl;
      case 2:
        return 'https://play.pokemonshowdown.com/sprites/ani/${widget.pokemon.nome}.gif';
      default:
        return widget.pokemon.spriteAnimatoUrl;
    }
  }

  //Inizializza a schermo le informazioni è recupera la descrizione e il tipo in italiano
  @override
  void initState() {
    super.initState();
    _fetchDescrizione();
    _fetchTipo();
  }

  /*
  Funzione che recupera la descrizione in italiano del Pokémon
  */
  Future<void> _fetchDescrizione() async {
    //Facciamo una chiamata API sulla specie del Pokèmon
    final res = await http.get(
      Uri.parse(
        'https://pokeapi.co/api/v2/pokemon-species/${widget.pokemon.id}',
      ),
    );
    //Decodifica il JSON e inizializziamo voci come lista di "descrizioni"
    final data = jsonDecode(res.body);
    final voci = data['flavor_text_entries'] as List;
    //Prendiamo il primo elemento con corrispondenza per la lingua italiana
    //Altrimenti prendiamo la descrizione inglese di default
    final ita = voci.firstWhere(
      (e) => e['language']['name'] == 'it',
      orElse: () => voci.firstWhere((e) => e['language']['name'] == 'en'),
    );
    //Aggiorna a schermo la descrizione con la Stringa in italiano
    setState(() {
      _descrizione = (ita['flavor_text'] as String);
    });
  }

  /*
  Funzione che recupera i tipi in italiano del Pokémon
  */
  Future<void> _fetchTipo() async {
    //Con Map facciamo una chiamata API per ogni tipo del pokémon
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
    //Aggiorna a schermo i tipi, unendoli con '/', in italiano
    setState(() => _tipoIta = nomiIta.join(' / '));
  }

  /*
  Funzione per riprodurre il verso del Pokémon
  */
  Future<void> _riproduciVerso() async {
    await audioPlayer.play(UrlSource(widget.pokemon.versoUrl));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('${widget.pokemon.nome} (#${widget.pokemon.id})'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                _spriteCorrente,
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
                onPressed: () =>
                    setState(() => _spriteStato = (_spriteStato + 1) % 3),
                child: Text(
                  _spriteStato == 0
                      ? 'Normale'
                      : _spriteStato == 1
                      ? 'Shiny ✨'
                      : '3D 🎮',
                ),
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
