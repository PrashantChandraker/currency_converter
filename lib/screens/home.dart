import 'package:currency_converter/components/any_To_any.dart';
import 'package:currency_converter/components/usd_To_Any.dart';
import 'package:currency_converter/functions/fetch_rates.dart';
import 'package:currency_converter/models/rates_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<RatesModel> result;
  late Future<Map> allCurrencies;

  final formkey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    result = fetchrates();
    allCurrencies = fetchcurrencies();
  }
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text(
          'Currency Converter',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: 
        SingleChildScrollView(
          child: Form(
            key: formkey,
            child: FutureBuilder<RatesModel>(future: result, builder: (context, snapshot){
              if(snapshot.connectionState ==ConnectionState.waiting){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Center(
                child: FutureBuilder<Map>(future: allCurrencies, builder: (context, currSnapshot){
                  if(currSnapshot.connectionState == ConnectionState.waiting){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                    
                  }
                  return Column(
                    children: [
                      UsdToAny(rates: snapshot.data!.rates, currencies: currSnapshot.data!),
                      SizedBox(height: 20,),
                      AnyToAny(rates:snapshot.data!.rates, currencies: currSnapshot.data!)
                    ],
                  );
                },),
              );
            },),
          ),
        ),
      ),
    );
  }
}
