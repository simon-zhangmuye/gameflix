import 'package:flutter/material.dart';
import 'package:gameflix/data.dart';

import '../widges/gradient_background.dart';

class HomePage extends StatelessWidget {
  Widget _imageScrollBackground() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: PageScrollPhysics(),
        itemCount: featuredGames.length,
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(featuredGames[index].imageURL),
                fit: BoxFit.cover,
              ),
            ),
          );
        });
  }

  Widget _infoColumn(context) {
    return Column(
      children: [
        _topBar(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        Text(
          'Assasin\'s Creed Odyssey',
          style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
        SizedBox(height: 10),
        _gameList(context, games),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: _gameBanner(context),
        ),
        _gameList(context, games_2),
      ],
    );
  }

  Widget _topBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 25,
          ),
          Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.white,
                size: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 25,
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _gameList(context, List<GameData> games) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: games.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(games[index].imageURL),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            );
          }),
    );
  }

  Widget _gameBanner(context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS57KEwIUVWjOvx4Z-cN2Ty9hOEhbw2sNVvig&usqp=CAU'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.35),
            child: _imageScrollBackground(),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
            child: gradientBackground(
                Colors.transparent, Color.fromRGBO(35, 45, 59, 1)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: _infoColumn(context),
          ),
        ],
      ),
    );
  }
}
