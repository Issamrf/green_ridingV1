import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'DirectionsModel.dart';

class DirectionsRepository {
  static const String _baseUrl =
      'https://poc-api-vcoxoy66iq-uw.a.run.app/latest_trip';

  final Dio _dio;

  DirectionsRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<dynamic> getDirections() async {
    print("im here");
    final response = await _dio.get(
      _baseUrl,
    );

    // Check if response is successful
    if (response.statusCode == 200) {
      // final data = json.decode(response.data.toString());
      // print(data);
      return response.data;
      //  return Directions.fromMap(response.data);
    }
    return null;
  }
}
