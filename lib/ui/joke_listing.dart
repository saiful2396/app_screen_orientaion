import 'package:app_screen_orientaion/model/funny_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JokeListing extends StatelessWidget {

  final ValueChanged<Joke> jokeSelectedCallback;
  final Joke selectedJoke;
  JokeListing({@required this.jokeSelectedCallback, this.selectedJoke});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: jokesList.map((jokes) {
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4.5),
          ),
            child: ListTile(
              title: Text(jokes.setup),
              onTap: () => jokeSelectedCallback(jokes),
              selected: selectedJoke == jokes,
            ),
        );
      }).toList(),
    );
  }
}
