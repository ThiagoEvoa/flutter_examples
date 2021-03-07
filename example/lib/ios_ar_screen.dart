import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:arkit_plugin/widget/arkit_scene_view.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'dart:math' as math;

class IosARScreen extends StatefulWidget {
  @override
  _IosARScreenState createState() => _IosARScreenState();
}

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
