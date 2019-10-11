import 'dart:async';
import 'dart:convert' show json, utf8;
import 'dart:io';

import 'package:category_widget/category.dart';

/// The REST API retrieves unit conversions for [Categories] that change.
///
/// For example, the currency exchange rate, stock prices, the height of the
/// tides change often.
/// We have set up an API that retrieves a list of currencies and their current
/// exchange rate (mock data).
///   GET /currency: get a list of currencies
///   GET /currency/convert: get conversion from one currency amount to another
class Api {

  final String baseUrl = 'flutter.udacity.com';
  final HttpClient httpClient = HttpClient();

  /// Gets all the units and conversion rates for a given category.
  ///
  /// The `category` parameter is the name of the [Category] from which to
  /// retrieve units. We pass this into the query parameter in the API call.
  ///
  /// Returns a list. Returns null on error.
  Future<List> getUnits(String category) async {
    try {
      final uri = Uri.https(baseUrl, '/$category');
      final httpRequest = await httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();

      final responseBody = await httpResponse.transform(utf8.decoder).join();
      final jsonResponse = json.decode(responseBody);

      return jsonResponse['units'];
    } on Exception catch (e) {
        print('$e');
        return null;
    }
  }

  /// Given two units, converts from one to another.
  ///
  /// Returns a double, which is the converted amount. Returns null on error.

  Future<double> convert(String category, String amount, String fromUnit, String toUnit) async {
    try{
      final uri = Uri.https(baseUrl, '/$category/convert', {
        'amount': amount, 'from': fromUnit, 'to': toUnit
      });

      final httpRequest = await httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();

      final responseBody = await httpResponse.transform(utf8.decoder).join();
      final jsonResponse = json.decode(responseBody);

      return jsonResponse['conversion'].toDouble();
    } on Exception catch (e) {
        print('$e');
        return null;
    }
  }
}
