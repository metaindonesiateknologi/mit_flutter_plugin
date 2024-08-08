import Flutter
import UIKit

public class MitFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "mit_flutter_plugin", binaryMessenger: registrar.messenger())
    let instance = MitFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func dummyMethodToEnforceBundling() {
    RustWrapper().searchAddressByName("", lat:"", lon:"", appid:"", token:"");
    RustWrapper().searchAddressByCoord("", lon:"", appid:"", token:"");
    RustWrapper().mapRoute("", startLat: "", startLon: "", dest: "", destLat: "", destLon: "", appid: "", token: "");
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
      case "searchAddressByName":
        if let args = call.arguments as? [String: Any],
           let text = args["text"] as? String,
           let lat = args["lat"] as? String,
           let lon = args["lon"] as? String,
           let token = args["token"] as? String,
           let appid = Bundle.main.bundleIdentifier as? String {
          result(RustWrapper().searchAddressByName(text, lat: lat, lon: lon, appid: appid, token: token))
        } else {
          result(FlutterError(code: "INVALID_ARGUMENT", message: "Invalid argument", details: nil))
        }
      case "searchAddressByCoord":
        if let args = call.arguments as? [String: Any],
           let lat = args["lat"] as? String,
           let lon = args["lon"] as? String,
           let token = args["token"] as? String,
           let appid = Bundle.main.bundleIdentifier as? String {
          result(RustWrapper().searchAddressByCoord(lat, lon: lon, appid: appid, token: token))
        } else {
          result(FlutterError(code: "INVALID_ARGUMENT", message: "Invalid argument", details: nil))
        }
      case "mapRoute":
        if let args = call.arguments as? [String: Any],
           let start = args["start"] as? String,
           let startLat = args["startLat"] as? String,
           let startLon = args["startLon"] as? String,
           let dest = args["dest"] as? String,
           let destLat = args["destLat"] as? String,
           let destLon = args["destLon"] as? String,
           let token = args["token"] as? String,
           let appid = Bundle.main.bundleIdentifier as? String {
          result(RustWrapper().mapRoute(start, startLat: startLat, startLon: startLon, dest: dest, destLat: destLat, destLon: destLon, appid: appid, token: token))
        } else {
          result(FlutterError(code: "INVALID_ARGUMENT", message: "Invalid argument", details: nil))
        }
      case "getPlatformVersion":
        result("iOS " + UIDevice.current.systemVersion)
      default:
        result(FlutterMethodNotImplemented)
    }
  }
}
