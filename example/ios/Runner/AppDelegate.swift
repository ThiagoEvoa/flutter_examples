import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window?.rootViewController as! FlutterBinaryMessenger
    let channel = FlutterMethodChannel(name: "my_channel", binaryMessenger: controller)
    
    DispatchQueue.main.async {
        channel.setMethodCallHandler({
            (call: FlutterMethodCall, result: FlutterResult) -> Void in
            guard call.method == "getMessage" else{
                result(FlutterMethodNotImplemented)
                return
            }
            self.getMessage(result: result)
        })
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func getMessage(result: FlutterResult){
        result("iOS Channel")
    }
}
