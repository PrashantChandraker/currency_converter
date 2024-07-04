import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../functions/fetch_rates.dart';

class UsdToAny extends StatefulWidget {
  final rates;
  final Map currencies;
  const UsdToAny({Key? key, required this.rates, required this.currencies})
      : super(key: key);

  @override
  State<UsdToAny> createState() => _UsdToAnyState();
}

class _UsdToAnyState extends State<UsdToAny> {
  TextEditingController usdController = TextEditingController();
  String dropDownValue = 'INR';
  String answer = 'Converted Currency';
  @override
  Widget build(BuildContext context) {
    // var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Card(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.red,
              alignment: Alignment.center,
              child: Text(
                'USD To Any Currency',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //Text('USD to any Currency'),
            TextFormField(
              key: Key('USD'),
              controller: usdController,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter USD',
                hintStyle: TextStyle(color: Colors.white),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.grey.shade900,
                    value: dropDownValue,
                    style: TextStyle(color: Colors.white),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    // items: ,
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          dropDownValue = newValue!;
                        },
                      );
                    },
                    items: widget.currencies.keys
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // convert button
                
              ],
            ),
            Card(
                  elevation: 10,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Container(
                    height: 50,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          answer = usdController.text +
                              'USD     =      ' +
                              convertUSD(widget.rates, usdController.text,
                                  dropDownValue) +
                              '  ' +
                              dropDownValue;
                        });
                      },
                      child: Text(
                        'Convert',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                25), // Match the button's border radius with the card
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                answer,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
