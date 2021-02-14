import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class testCard extends StatelessWidget {
  int colors = 0xFFff8a80;
  int i = 0;
  testCard(int choose){
    // if(choose==1){
    //   colors = 0xFFff8a80;
    // }else{
    //   colors = 0xFFbcaaa4;
    // }
    i = choose;
    switch(choose){
      case 1:
        colors = 0xFFff8a80;
        break;
      case 2:
        colors =  0xFFc5e1a5;
        break;
      default:
        colors = 0xFFffe57f;
    }
  }
  final String picLink =
      "https://imageproxy.icook.network/resize?background=255%2C255%2C255&height=675&nocrop=false&stripmeta=true&type=auto&url=http%3A%2F%2Ftokyo-kitchen.icook.tw.s3.amazonaws.com%2Fuploads%2Frecipe%2Fcover%2F216843%2F5867f51c91e53841.jpg&width=1200";

  @override
  Widget build(BuildContext context) {
    return Card(
      color:Color(colors),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: NetworkImage(picLink),
            width: 1200.0,
            height: 180.0,
          ),
          ListTile(
            title: const Text('海鮮貝殼麵',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            // subtitle: Text(
            //   'Secondary Text',
            //   style: TextStyle(color: Colors.black.withOpacity(0.6)),
            // ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Baseline(
                  baseline: 34.0,
                  baselineType: TextBaseline.alphabetic,
                  child: Text(
                    '${i} ',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Baseline(
                  baseline: 30.0,
                  baselineType: TextBaseline.alphabetic,
                  child: Text(
                    '小時後過期',
                    style: TextStyle(color: Colors.red, fontSize: 23.0),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text("我忘了吃這個..."),
              ),
              ChoiceChip(
                selectedColor:Color(0xFFbbdefb),

                label: Text('配酒首選'),
                selected: true,
                onSelected: (bool value) {},
              ),
              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFffca28),
                      onPrimary: Colors.white,
                      onSurface: Colors.grey,
                    ),
                    onPressed: () {
                      // Perform some action
                    },
                    child: const Text('拯救食物',style:TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60.0),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(height: 350.0),
            items: [1, 2, 3, 4, 6].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  // return Container(
                  //     width: MediaQuery.of(context).size.width,
                  //     margin: EdgeInsets.symmetric(horizontal: 5.0),
                  //     decoration: BoxDecoration(
                  //         color: Colors.deepPurple
                  //     ),
                  //     child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                  // );
                  return testCard(i);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
