import 'package:currency_converter/models/allCurrencies.dart';
import 'package:currency_converter/utils/key.dart';
import 'package:http/http.dart' as http;

import '../models/rates_model.dart';

Future<RatesModel> fetchrates() async{
  final response = await http.get(Uri.parse('https://openexchangerates.org/api/latest.json?app_id=' + apikey));
  print(response.body);
  final result = ratesModelFromJson(response.body);
  return result;
}

Future<Map> fetchcurrencies() async{
  final response = await http.get(Uri.parse('https://openexchangerates.org/api/currencies.json?app_id=' + apikey));
  // print(response.body);
  final allCurrencies = allCurrenciesFromJson(response.body);
  return allCurrencies;
}

String convertUSD(Map exchangeRates, String usd, String currency){
  String output = ((exchangeRates[currency] * double.parse(usd)).toStringAsFixed(2)).toString();
  return output;

}

String covertany(Map exchangeRates,String amount,String currencybase,String currencyfinal){
  String output = ((double.parse(amount) / exchangeRates[currencybase]) * exchangeRates[currencyfinal]).toStringAsFixed(2).toString();
  print('output => $output');
  return output;
  
}