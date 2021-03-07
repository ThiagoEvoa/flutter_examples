# Aumented Reality

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  arcore_flutter_plugin: ^0.0.10
  arkit_plugin: ^0.6.1
```

### Configuration

#### iOS Info.plist
> Add those lines into the Info.plist, to be able to ask for user permission 

```dart
<key>NSCameraUsageDescription</key>
<string>Describe why your app needs AR here.</string>

<key>io.flutter.embedded_views_preview</key>
<string>YES</string>
```

#### Android App Gradle
> Add those lines into the App Gradle, to be able to ask for user permission 

```dart
android {
    compileOptions {
        sourceCompatibility 1.8
        targetCompatibility 1.8
    }
}

dependencies {
    // Provides ArFragment, and other UX resources.
    implementation 'com.google.ar.sceneform.ux:sceneform-ux:1.8.0'

    // Alternatively, use ArSceneView without the UX dependency.
    implementation 'com.google.ar.sceneform:core:1.8.0'
}
```

### Main
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Platform.isIOS ? IosARScreen() : AndroidARScreen(),
    );
  }
}
```

### IosARScreen
```dart
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:arkit_plugin/widget/arkit_scene_view.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'dart:math' as math;

class _IosARScreenState extends State<IosARScreen> {
  ARKitController _arKitController;
  ARKitNode _arKitNode;
  ARKitPlane _arKitPlane;
  ARKitSphere _arKitSphere;
  String _anchorId;

  _onARKitViewCreated(ARKitController controller) {
    _arKitController = controller;
    _arKitController.onAddNodeForAnchor = _onAddNodeForAnchor;
    _arKitController.onUpdateNodeForAnchor = _onUpdateNodeForAnchor;
  }

  _onAddNodeForAnchor(ARKitAnchor anchor) async {
    if (!(anchor is ARKitPlaneAnchor)) {
      return;
    }

    if (_arKitNode != null) {
      await _arKitController.remove(_arKitNode.name);
    }

    _addSphere(_arKitController, anchor);
  }

  _onUpdateNodeForAnchor(ARKitAnchor anchor) {
    if (anchor.identifier != _anchorId) {
      return;
    }

    final ARKitPlaneAnchor planeAnchor = anchor;
    _arKitNode.position =
        vector.Vector3(planeAnchor.center.x, 0, planeAnchor.center.z);
    _arKitPlane.width.value = planeAnchor.extent.x;
    _arKitPlane.height.value = planeAnchor.extent.z;
  }

  _addSphere(ARKitController controller, ARKitPlaneAnchor anchor) {
    _anchorId = anchor.identifier;

    _arKitSphere = ARKitSphere(
      radius: 0.1,
      materials: [
        ARKitMaterial(
          diffuse: ARKitMaterialProperty(
            color: Colors.red,
          ),
        ),
      ],
    );
    _arKitNode = ARKitNode(
      name: 'sphere',
      geometry: _arKitSphere,
      position: vector.Vector3(anchor.center.x, 0, anchor.center.z),
      rotation: vector.Vector4(1, 0, 0, -math.pi / 2),
    );
    controller.add(_arKitNode, parentNodeName: anchor.nodeName);
  }

  @override
  void dispose() {
    _arKitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ARKitSceneView(
      showFeaturePoints: true,
      planeDetection: ARPlaneDetection.horizontal,
      onARKitViewCreated: _onARKitViewCreated,
    );
  }
}
```

### AndroidARScreen
```dart
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';

class _AndroidARScreenState extends State<AndroidARScreen> {
  ArCoreController _arCoreController;
  ArCoreNode _arCoreNode;

  _onArCoreViewCreated(ArCoreController controller) {
    _arCoreController = controller;
    _arCoreController.onPlaneDetected = _handleOnPlaneDetected;
  }

  _handleOnPlaneDetected(ArCorePlane arCorePlane) async{
    if (_arCoreNode != null) {
      await _arCoreController.removeNode(nodeName: _arCoreNode.name);
    }
    _addSphere(_arCoreController, arCorePlane);
  }

  _addSphere(ArCoreController controller, ArCorePlane plane) {
    ArCoreMaterial arCoreMaterial = ArCoreMaterial(
      color: Colors.red,
    );

    ArCoreSphere sphere = ArCoreSphere(
      materials: [arCoreMaterial],
      radius: 0.1,
    );

    _arCoreNode = ArCoreNode(
      name: 'sphere',
      shape: sphere,
      position: plane.centerPose.translation,
      rotation: plane.centerPose.rotation,
    );

    _arCoreController.addArCoreNode(_arCoreNode);
  }

  @override
  void dispose() {
    _arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ArCoreView(
      onArCoreViewCreated: _onArCoreViewCreated,
      enableUpdateListener: true,
    );
  }
}
```

