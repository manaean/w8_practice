import 'package:flutter/material.dart';

import 'jokes.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
      home: JokesApp(),
    ));

class JokesApp extends StatefulWidget {
  const JokesApp({
    super.key,
  });

  @override
  State<JokesApp> createState() => _JokesAppState();
}

class _JokesAppState extends State<JokesApp> {
  int? _favoriteIndex;

  void _setFavorite(int index) {
    setState(() {
      if (_favoriteIndex == index) {
        _favoriteIndex = null;
      } else {
        _favoriteIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: ListView(
        children: [
          for (var i = 0; i < jokes.length; i++)
          FavoriteCard(
            joke: jokes[i],
            isFavorite: i == _favoriteIndex,
            onFavoriteClick: () => _setFavorite(i),
          ),
        ],
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.joke,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  final Joke joke;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style:
                      TextStyle(color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(joke.description),
              ],
            ),
          ),
          IconButton(
              onPressed: onFavoriteClick,
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ))
        ],
      ),
    );
  }
}
