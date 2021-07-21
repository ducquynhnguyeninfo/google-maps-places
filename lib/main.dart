import 'package:flutter/material.dart';
import 'package:places/features/places/presentation/common_widgets/transparent_image.dart';
import 'package:places/config/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(SizeConfig.default_padding),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: SizeConfig.default_padding),
                child: InkWell(
                  onTap: () {},
                  child: Material(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeConfig.default_radius)),
                    child: Container(
                      height: 100,
                      color: Colors.pink[100],
                      child: Column(
                        children: [
                        FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: 'https://picsum.photos/250?image=9',
                      )


                      ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("hello");
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}


