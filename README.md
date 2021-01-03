# Flutter Swiper
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flutter_swiper.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  flutter_swiper: ^1.1.6
```

```dart
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
```
