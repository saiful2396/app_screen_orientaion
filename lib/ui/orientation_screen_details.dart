import 'package:app_screen_orientaion/model/funny_class.dart';
import 'package:app_screen_orientaion/ui/joke_details.dart';
import 'package:app_screen_orientaion/ui/joke_listing.dart';
import 'package:flutter/material.dart';

class ScreenOrientationDetails extends StatefulWidget {
  @override
  _ScreenOrientationDetailsState createState() =>
      _ScreenOrientationDetailsState();
}

class _ScreenOrientationDetailsState extends State<ScreenOrientationDetails> {
  static const int tabletBreakPoint = 600;
  Joke _selectedJoke;

  Widget _buildMobileView() {
    return JokeListing(jokeSelectedCallback: (selectedJoke) {
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return JokeDetails(isInTablet: false, joke: selectedJoke);
      }));
    });
  }

  Widget _buildTabletView() {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Material(
            elevation: 13.0,
            child: JokeListing(jokeSelectedCallback: (joke) {
              setState(() {
                _selectedJoke = joke;
              });
            }, selectedJoke: _selectedJoke,),
          ),
        ),
        Flexible(
          flex: 3,
            child: JokeDetails(isInTablet: true, joke: _selectedJoke),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget content;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait && shortestSide < tabletBreakPoint) {
      // Mobile
      content = _buildMobileView();
    } else {
      // tablet
      content = _buildTabletView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Funny App'),
        centerTitle: true,
      ),
      body: content,
    );
  }
}
