import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MitFlutterPluginBindings {
  final Pointer<T> Function<T extends NativeType>(String symbolName) _lookup;

  MitFlutterPluginBindings(DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  MitFlutterPluginBindings.fromLookup(
      Pointer<T> Function<T extends NativeType>(String symbolName) lookup)
      : _lookup = lookup;

  Future<String> searchAddressByCoord(
      String lat, String lon, String token) async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appid = packageInfo.packageName;

    var p1 = lat.toNativeUtf8();
    var p2 = lon.toNativeUtf8();
    var p3 = appid.toNativeUtf8();
    var p4 = token.toNativeUtf8();

    final Pointer<Utf8> resultPtr = _searchByCoordFunction(p1, p2, p3, p4);
    final String result = resultPtr.toDartString();

    return result;
  }

  Future<String> searchAddressByName(String search, String token) async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appid = packageInfo.packageName;

    String lat = "";
    String lon = "";

    var p1 = search.toNativeUtf8();
    var p2 = lat.toNativeUtf8();
    var p3 = lon.toNativeUtf8();
    var p4 = appid.toNativeUtf8();
    var p5 = token.toNativeUtf8();

    final Pointer<Utf8> resultPtr = _searchByNameFunction(p1, p2, p3, p4, p5);
    final String result = resultPtr.toDartString();

    return result;
  }

  Future<String> searchMapRoute(String start, String startLat, String startLon,
      String dest, String destLat, String destLon, String token) async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appid = packageInfo.packageName;

    var startNative = start.toNativeUtf8();
    var startLatNative = startLat.toNativeUtf8();
    var startLonNative = startLon.toNativeUtf8();
    var destNative = dest.toNativeUtf8();
    var destLatNative = destLat.toNativeUtf8();
    var destLonNative = destLon.toNativeUtf8();
    var appidNative = appid.toNativeUtf8();
    var tokenNative = token.toNativeUtf8();

    final Pointer<Utf8> resultPtr = _searchMapRouteFunction(
        startNative,
        startLatNative,
        startLonNative,
        destNative,
        destLatNative,
        destLonNative,
        appidNative,
        tokenNative);

    final String result = resultPtr.toDartString();

    return result;
  }

  late final _searchByCoordFunctionPtr = _lookup<
      NativeFunction<
          Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>,
              Pointer<Utf8>)>>('search_address_by_coord');
  late final _searchByCoordFunction = _searchByCoordFunctionPtr.asFunction<
      Pointer<Utf8> Function(
          Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>)>();

  late final _searchByNameFunctionPtr = _lookup<
      NativeFunction<
          Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>,
              Pointer<Utf8>, Pointer<Utf8>)>>('search_address_by_name');
  late final _searchByNameFunction = _searchByNameFunctionPtr.asFunction<
      Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>,
          Pointer<Utf8>, Pointer<Utf8>)>();

  late final _searchMapRouteFunctionPtr = _lookup<
      NativeFunction<
          Pointer<Utf8> Function(
              Pointer<Utf8>,
              Pointer<Utf8>,
              Pointer<Utf8>,
              Pointer<Utf8>,
              Pointer<Utf8>,
              Pointer<Utf8>,
              Pointer<Utf8>,
              Pointer<Utf8>)>>('map_route');
  late final _searchMapRouteFunction = _searchMapRouteFunctionPtr.asFunction<
      Pointer<Utf8> Function(
          Pointer<Utf8>,
          Pointer<Utf8>,
          Pointer<Utf8>,
          Pointer<Utf8>,
          Pointer<Utf8>,
          Pointer<Utf8>,
          Pointer<Utf8>,
          Pointer<Utf8>)>();
}
