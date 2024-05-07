# [Google Places for Flutter 3](https://pub.dev/packages/google_places_for_flutter_3)

A Flutter package which uses the Google Maps API to make a TextField that autocomplete places as the user types in.
It also gives coordinates and more ...

Extended [Google Maps for Flutter](https://pub.dev/packages/google_maps_flutter) plugin

This is a package that seeks to maintain the package that has not been updated for more than 3 years: [google_places_for_flutter](https://pub.dev/packages/google_places_for_flutter)

[![pub package](https://img.shields.io/pub/v/google_places_for_flutter_3.svg)](https://pub.dev/packages/google_places_for_flutter_3)


## Installation

``` 
flutter pub add google_places_for_flutter_3
 
```

or


```
dependencies:
  google_places_for_flutter_3: ^1.0.0

```

## Usage

```dart

import 'package:google_places_for_flutter/google_places_for_flutter_3.dart';

SearchGooglePlacesWidget(
    placeType: PlaceType.address, // PlaceType.cities, PlaceType.geocode, PlaceType.region etc
    placeholder: 'Enter the address',
    apiKey:
        'Your Google Map API Key goes here',
    onSearch: (Place place) {},
    onSelected: (Place place) async {
      print('address ${place.description}');
      
    },
),
```

```dart
SearchGooglePlacesWidget(
    apiKey: 'Your Google Map API Key goes here',
    // The language of the autocompletion
    language: 'en',
    // The position used to give better recomendations. In this case we are using the user position
    location: userPosition.coordinates,
    radius: 30000,
    onSelected: (Place place) async {
        final geolocation = await place.geolocation;

        // Will animate the GoogleMap camera, taking us to the selected position with an appropriate zoom
        final GoogleMapController controller = await _mapController.future;
        controller.animateCamera(CameraUpdate.newLatLng(geolocation.coordinates));
        controller.animateCamera(CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
    },
);
```

## Some Images
![image](https://github.com/StormShadonw/google_places_for_flutter_3/assets/20448268/46c5c0bd-983e-4657-b17e-99c50378aadb)
![image](https://github.com/StormShadonw/google_places_for_flutter_3/assets/20448268/b537cb4f-d839-4c62-a1bd-6256827de351)

