import 'package:flutter/material.dart';
import 'constants.dart';
import 'containerstyle.dart';
import 'countriesdata.dart';
import 'dart:core';
import 'richtextstyle.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
    return Container(
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
                    child: containerStyle(richTextChild:
                    RichTextStyle(
                    title: TextSpan(
                    text: 'CASES:\n ',
                    ),
                    number: TextSpan(
                      text: '${_country.todayCases}',style: TextStyle(height: 3.0),
                    ),
                    ),
                    ),
                    ),
                  Expanded(
                    child: containerStyle(
                      richTextChild:
                      RichTextStyle(
                        title: TextSpan(
                          text: 'DEATHS:\n ',
                        ),
                        number: TextSpan(
                          text: '${_country.todayDeaths}',style: TextStyle(height: 3.0,color: Colors.red),
                        ),
                      ),),
                  ),
                  Expanded(
                    child:containerStyle(
                      richTextChild:
                      RichTextStyle(
                        title: TextSpan(
                          text: 'RECOVERED:\n ',
                        ),
                        number: TextSpan(
                          text: '${_country.todayRecovered}',style: TextStyle(height: 3.0,color: Colors.green.shade800),
                        ),
                      ),),
                  ),
                ],
              ),
              SizedBox(height: 25.0),
              Text('TOTAL NUMBERS:',style: kTitleStyle,),
              Row(
                children: [
                  Expanded(
                    child: containerStyle(
                      richTextChild:
                      RichTextStyle(
                        title: TextSpan(
                          text: 'CASES:\n ',
                        ),
                        number: TextSpan(
                          text: '${_country.tests}',style: TextStyle(height: 3.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: containerStyle(
                      richTextChild:
                      RichTextStyle(
                        title: TextSpan(
                          text: 'CASES:\n ',
                        ),
                        number: TextSpan(
                          text: '${_country.cases}',style: TextStyle(height: 3.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: containerStyle(
                      richTextChild:
                      RichTextStyle(
                        title: TextSpan(
                          text: 'CASES:\n ',
                        ),
                        number: TextSpan(
                          text: '${_country.deaths}',style: TextStyle(height: 3.0,color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: containerStyle(
                      richTextChild:
                      RichTextStyle(
                        title: TextSpan(
                          text: 'CASES:\n ',
                        ),
                        number: TextSpan(
                          text: '${_country.recovered}',style: TextStyle(height: 3.0,color: Colors.green.shade800),
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
    );
  }
}
