import 'package:currency_converter/utils/key.dart';
import 'package:http/http.dart' as http;

import '../models/rates_model.dart';

Future<RatesModel> fetchrates() async{
  final response = await http.get(Uri.parse('https://openexchangerates.org/api/latest.json?app_id=' + apikey));
  print(response.body);
  final result = ratesModelFromJson(response.body);
  return result;
}