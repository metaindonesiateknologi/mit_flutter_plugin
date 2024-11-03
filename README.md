# MIT Geocode/Reverse-Geocode Flutter Plugin

MIT Geocode/Reverse-Geocode plugin for Flutter, supporting both Android and iOS.

## Installation

To add this plugin to your Flutter project, include it in your `pubspec.yaml` file:

```yaml
dependencies:
  mit_flutter_plugin:
    git:
      url: https://github.com/metaindonesiateknologi/mit_flutter_plugin.git
```

Then, run the following command to fetch the package:

```sh
flutter pub get
```

### iOS Setup

For iOS, navigate to the `ios` directory of your Flutter project and run:

```sh
pod install
```

## Usage


```sh
import 'package:mit_flutter_plugin/mit_flutter_plugin.dart'

Future<List<Place>> getPlace(String text) async {
  List<Place> listPlace = [];
  try {
      var r = await mit_flutter_plugin
          .searchAddressByName(text, "your-registered-token")
          .timeout(const Duration(seconds: 5));
      var r3 = jsonDecode(r);
      for (var i = 0; i < r3.length; i++) {
        if (r3[i]["name"] != "" &&
            r3[i]["latitude"] != "" &&
            r3[i]["latitude"] != "null" &&
            r3[i]["longitude"] != "" &&
            r3[i]["longitude"] != "null") {
          if (r3[i]["address"] != "") {
            r3[i]["name"] += '\n${r3[i]["address"]}';
          }

          Place dataPlace = Place.fromJson(r3[i]);
          listPlace.add(dataPlace);
        }
      }
    }
  } catch (e) {
    debugPrint('error getplace: $e');
  }

  return listPlace;
}

Future<String> getAddressByLatLon(lat, lon) async {
  try {
    var r = await mit_flutter_plugin
        .searchAddressByCoord(lat.toString(), lon.toString(), "your-registered-token")
        .timeout(const Duration(seconds: 5));

    return r;
  } catch (e) {
    debugPrint('error getAddressByLatLon: $e');
  }
  return '';
}
```

This ensures that all the necessary dependencies for iOS are properly installed.