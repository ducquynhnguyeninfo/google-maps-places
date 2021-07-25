import 'package:flutter/material.dart';
import 'package:places/values/values.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Avengers'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MySuperHero {
  final String img;
  final String title;
  final String body;

  MySuperHero(this.img, this.title, this.body);
}

class _MyHomePageState extends State<MyHomePage> {
  List<MySuperHero> items = new List<MySuperHero>.empty(growable: true);

  _MyHomePageState() {
    items.add(new MySuperHero(assetImages + 'cafe-placeholder.png', "Iron Man",
        "Genius. Billionaire. Playboy. Philanthropist. Tony Stark's confidence is only matched by his high-flying abilities as the hero called Iron Man."));
    // items.add(new MySuperHero("assets/captain_america.png", "Captain America",
    //     "Recipient of the Super-Soldier serum, World War II hero Steve Rogers fights for American ideals as one of the world’s mightiest heroes and the leader of the Avengers."));
    // items.add(new MySuperHero("assets/thor.png", "Thor",
    //     "The son of Odin uses his mighty abilities as the God of Thunder to protect his home Asgard and planet Earth alike."));
    // items.add(new MySuperHero("assets/hulk.png", "Hulk",
    //     "Dr. Bruce Banner lives a life caught between the soft-spoken scientist he’s always been and the uncontrollable green monster powered by his rage."));
    // items.add(new MySuperHero("assets/black_widow.png", "Black Widow",
    //     "Despite super spy Natasha Romanoff’s checkered past, she’s become one of S.H.I.E.L.D.’s most deadly assassins and a frequent member of the Avengers."));
  }

  Widget SuperHeroCell(BuildContext ctx, int index) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(content: Text("Tap"));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyDetailPage(items[index])));
      },
      child: Card(
          margin: EdgeInsets.all(8),
          elevation: 4.0,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Hero(
                      tag: items[index],
                      child: Image.asset(items[index].img, height: 100,),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      items[index].title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Icon(Icons.navigate_next, color: Colors.black38),
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => SuperHeroCell(context, index),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyDetailPage extends StatefulWidget {
  final MySuperHero superHero;

  MyDetailPage(this.superHero);

  @override
  _MyDetailPageState createState() => _MyDetailPageState(superHero);
}

class _MyDetailPageState extends State<MyDetailPage> {
  MySuperHero superHero;

  _MyDetailPageState(this.superHero) {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Hero(
                    transitionOnUserGestures: true,
                    tag: superHero,
                    child: Transform.scale(
                      scale: 2.0,
                      child: Image.asset(superHero.img),
                    ),
                  ),
                  Card(
                      elevation: 8,
                      margin: EdgeInsets.all(16),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Text(superHero.body),
                      )),
                ],
              ))

    );
  }
}
