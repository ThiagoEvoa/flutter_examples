import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<ScanResult> _deviceList = [];
  BluetoothDevice _targetDevice;
  StreamSubscription<List<ScanResult>> _subscription;
  List<BluetoothCharacteristic> _characteristics;
  List<BluetoothService> _services;
  List<BluetoothDescriptor> _descriptors;

  _scan() async {
    await flutterBlue.startScan(timeout: Duration(seconds: 10));

    setState(() {
      _subscription = flutterBlue.scanResults.listen((resultScan) {
        _deviceList = [];

        for (var result in resultScan) {
          if (!_deviceList.contains(result)) _deviceList.add(result);
        }
      }, onDone: _stopScan());
    });
  }

  _discoverServices() async {
    _targetDevice.discoverServices().then((services) async {
      for (BluetoothService service in services) {
        _services.add(service);
      }
    });
  }

  _discoverCharacteristics() async {
    for (BluetoothService service in _services) {
      for (BluetoothCharacteristic characteristic in service.characteristics) {
        _characteristics.add(characteristic);
      }
    }
  }

  _readCharacteristics() {
    for (BluetoothCharacteristic characteristic in _characteristics) {
      characteristic.read().then((characteristic) {
        print('Characteristic: $characteristic');
      });
    }
  }

  _readDescriptors() {
    for (BluetoothCharacteristic characteristic in _characteristics) {
      List<BluetoothDescriptor> descriptors = characteristic.descriptors;
      for (BluetoothDescriptor descriptor in descriptors) {
        print('Descriptor: $descriptor');
      }
    }
  }

  _connectDevice(BluetoothDevice targetDevice) {
    _targetDevice = targetDevice;
    _targetDevice.connect();
  }

  _disconnectDevice() {
    _targetDevice.disconnect();
  }

  _stopScan() {
    _subscription?.cancel();
    _subscription = null;
  }

  @override
  void initState() {
    _scan();
    super.initState();
  }

  @override
  void dispose() {
    _stopScan();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            onPressed: _scan,
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              _disconnectDevice();
            },
            icon: Icon(Icons.power_settings_new),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _deviceList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              _connectDevice(_deviceList[index].device);
            },
            onLongPress: _discoverServices,
            title: Text(
              _deviceList[index].device.name != ''
                  ? _deviceList[index].device.name
                  : _deviceList[index].device.id.toString(),
            ),
            subtitle: Text(BluetoothDeviceType.values[_deviceList[index].device.type.index].toString().split('.').last),
          );
        },
      ),
    );
  }
}
