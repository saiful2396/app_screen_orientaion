import 'package:app_screen_orientaion/model/funny_class.dart';
import 'package:flutter/material.dart';

class JokeDetails extends StatelessWidget {

  final bool isInTablet;
  final Joke joke;
  JokeDetails({@required this.isInTablet, @required this.joke});

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //? means just confirm for something that was exist or not it\'s like
        //a ternary operator
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            joke?.setup ?? 'No Joke Selected',
            style: textTheme.headline6,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              joke?.punchline ?? 'please select a joke',
            style: textTheme.subtitle1,
          ),
        ),
      ],
    );

    if (isInTablet) {
      return Center(child: content,);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(joke?.type ?? 'No jokes'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(child: content,),
    );
  }
}
