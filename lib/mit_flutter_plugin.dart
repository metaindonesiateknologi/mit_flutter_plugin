import 'dart:ffi';
import 'dart:io';

import 'mit_flutter_plugin_bindings_generated.dart';

Future<String> searchAddressByCoord(String a, String b, String c) =>
    _bindings.searchAddressByCoord(a, b, c);
Future<String> searchAddressByName(String a, String b) =>
    _bindings.searchAddressByName(a, b);
Future<String> searchMapRoute(String start, String startLat, String startLon,
        String dest, String destLat, String destLon, String geotoken) =>
    _bindings.searchMapRoute(
        start, startLat, startLon, dest, destLat, destLon, geotoken);

const String _libName = 'mit_flutter_plugin';

final DynamicLibrary _dylib = () {
  if (Platform.isMacOS || Platform.isIOS) {
    return DynamicLibrary.open('$_libName.framework/$_libName');
  }
  if (Platform.isAndroid || Platform.isLinux) {
    return DynamicLibrary.open('lib$_libName.so');
  }
  if (Platform.isWindows) {
    return DynamicLibrary.open('$_libName.dll');
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

final MitFlutterPluginBindings _bindings = MitFlutterPluginBindings(_dylib);
