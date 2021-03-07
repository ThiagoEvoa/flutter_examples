import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';

class AndroidARScreen extends StatefulWidget {
  @override
  _AndroidARScreenState createState() => _AndroidARScreenState();
}

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
