import 'package:flutter/cupertino.dart';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'countriesdata.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String countryName = 'Turkey'; // country selected by default
  Country _country;

  DropdownButton<String> dropDownMenu() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String countries in countryList) {
      var newItem = DropdownMenuItem(
        child: Text(countries,style: TextStyle(color: Colors.white),),
        value: countries,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      dropdownColor: Colors.purple,
      value: countryName,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          countryName = value;
          initialise();
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  void initialise() async {
    Country _temp = await fetchCountry(countryName);
    setState(() {
      _country = _temp;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade700,
            ),

          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: _country == null ? Center(child: CircularProgressIndicator()) : SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top:30.0,left:30.0,right:30.0,bottom:15.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text('COVID-19',style: TextStyle(color: Color(0xffeb5569),fontSize: 25.0,fontWeight: FontWeight.bold,fontFamily: 'Bungee'),),
                          Image.asset('assets/covid.png',height: 75,width: 75,),
                          SizedBox(height: 5.0),
                          Text('Güncelleme: ${_country.updatedDate}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
                          dropDownMenu(),


                        ],
                      ),
                    ),
                  ),
                  Text("TODAY'S NUMBER:",style: kTitleStyle,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          decoration: kBoxDecoration,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: kTextStyle,
                              children: [
                                TextSpan(text: 'CASES:\n'),
                                TextSpan(text: '${_country.todayCases}',style: TextStyle(height: 3.0)),
                              ]
                            ),
                          ),

                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          decoration: kBoxDecoration,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: kTextStyle,
                                children: [
                                  TextSpan(text: 'DEATHS:\n'),
                                  TextSpan(text: '${_country.todayDeaths}',style: TextStyle(height: 3.0,color: Colors.red)),
                                ]
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          decoration: kBoxDecoration,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: kTextStyle,
                                children: [
                                  TextSpan(text: 'RECOVERED:\n'),
                                  TextSpan(text: '${_country.todayRecovered}',style: TextStyle(height: 3.0,color: Colors.green.shade800)),
                                ]
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                    SizedBox(height: 25.0),
                    Text('TOTAL NUMBERS:',style: kTitleStyle,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          decoration: kBoxDecoration,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: kTextStyle,
                                children: [
                                  TextSpan(text: 'TESTS:\n'),
                                  TextSpan(text: '${_country.tests}',style: TextStyle(height: 3.0)),
                                ]
                            ),
                          ),

                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          decoration: kBoxDecoration,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: kTextStyle,
                                children: [
                                  TextSpan(text: 'CASES:\n'),
                                  TextSpan(text: '${_country.tests}',style: TextStyle(height: 3.0)),
                                ]
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          decoration: kBoxDecoration,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: kTextStyle,
                                children: [
                                  TextSpan(text: 'DEATHS:\n'),
                                  TextSpan(text: '${_country.deaths}',style: TextStyle(height: 3.0,color: Colors.red)),
                                ]
                            ),
                          ),

                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          decoration: kBoxDecoration,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: kTextStyle,
                                children: [
                                  TextSpan(text: 'RECOVERED:\n'),
                                  TextSpan(text: '${_country.recovered}',style: TextStyle(height: 3.0,color: Colors.green.shade800)),
                                ]
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ),
        ),


    );
  }
}

