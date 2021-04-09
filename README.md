# WidgetsBindingObserver
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/widgets_binding_observer.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  List<String> lifeCycles = [];

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      if (state == AppLifecycleState.inactive) {
        lifeCycles.add('app transitioning to other state.');
      } else if (state == AppLifecycleState.paused) {
        lifeCycles.add('app is on the background.');
      } else if (state == AppLifecycleState.detached) {
        lifeCycles.add('flutter engine is running but detached from views.');
      } else if (state == AppLifecycleState.resumed) {
        lifeCycles.add('app is visible and running.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: lifeCycles.length,
        itemBuilder: (context, index) {
          return Text(lifeCycles[index]);
        },
      ),
    );
  }
}
```
