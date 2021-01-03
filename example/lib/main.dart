import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = [
    'https://flutter.dev/images/flutter-logo-sharing.png',
    'https://www.oficinadanet.com.br/imagens/post/13939/android-10-google.jpg',
    'https://cergntnu.files.wordpress.com/2016/10/web-ios-logo.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Swiper(
        itemCount: items.length,
        itemWidth: 50,
        itemHeight: 50,
        pagination: SwiperPagination(),
        control: SwiperControl(),
        itemBuilder: (context, index) {
          return Image.network(
            items[index],
          );
        },
      ),
    );
  }
}
