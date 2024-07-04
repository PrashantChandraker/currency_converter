import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../functions/fetch_rates.dart';

class AnyToAny extends StatefulWidget {
  final rates;
  final Map currencies;
  const AnyToAny({Key? key, @required this.rates, required this.currencies})
      : super(key: key);

  @override
  _AnyToAnyState createState() => _AnyToAnyState();
}

class _AnyToAnyState extends State<AnyToAny> {
  TextEditingController amountController = TextEditingController();

  String dropDownValue1 = 'INR';
  String dropDownValue2 = 'AUD';
  String answer = 'Converted currency will be shown here : ';

  @override
  Widget build(BuildContext context) {
    // var w = MediaQuery.of(context).size.width;

    return Card(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.red,
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.right,
                'Convert Any Currency',
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
              key: ValueKey('amount'),
              controller: amountController,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter Amount',
                hintStyle: TextStyle(color: Colors.grey),
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
                    value: dropDownValue1,
                    style: TextStyle(color: Colors.black),
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
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          dropDownValue1 = newValue!;
                        },
                      );
                    },
                    items: widget.currencies.keys
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                // convert button
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'To',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.grey.shade900,
                    value: dropDownValue2,
                    style: TextStyle(color: Colors.black),
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
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          dropDownValue2 = newValue!;
                        },
                      );
                    },
                    items: widget.currencies.keys
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              elevation: 10,
              child: Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      answer = amountController.text + ' ' + dropDownValue1 + '  =  ' + covertany(widget.rates, amountController.text, dropDownValue1, dropDownValue2) + ' ' + dropDownValue2;
                    });
                  },
                  child: Text(
                    'Convert',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue.shade400),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(child: Text(answer, style: TextStyle(color: Colors.white,),),)
          ],
        ),
      ),
    );
  }
}
