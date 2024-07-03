import 'dart:convert';

RatesModel ratesModelFromJson(String str) => RatesModel.fromJson(json.decode(str));

String ratesModelToJson(RatesModel data) => json.encode(data.toJson());

class RatesModel{
  RatesModel({
   required this.disclaimer,
   required this.license,
   required this.timestamp,
   required this.base,
   required this.rates,

  });
  String disclaimer;
  String license;
  int timestamp;
  String base;
  Map<String, double> rates;

  factory RatesModel.fromJson(Map<String, dynamic> json) => RatesModel(
    base: json["base"],
    license: json["license"],
    timestamp: json["timestamp"],
    disclaimer: json["disclaimer"],
    rates: Map.from(json["rates"]).map((k, v) => MapEntry<String, double>(k, v.toDouble()))
  );

  Map<String, dynamic> toJson()=> {
    "disclaimer":disclaimer,
        "base": base,
    "license":license ,
    "timestamp":timestamp, 
    "rates": Map.from(rates).map((k, v) => MapEntry<String, double>(k, v.toDouble()))

  };
}