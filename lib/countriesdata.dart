import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


const List<String> countryList = [
  'United States',
  'India',
  'Brazil',
  'Russia',
  'France',
  'Turkey',
  'United Kingdom',
  'Italy',
  'Spain',
  'Argentina',
  'Colombia',
  'Germany',
  'Mexico',
  'Poland',
  'Iran',
  'Peru',
  'Ukraine',
  'South Africa',
  'Netherlands',
  'Indonesia',
  'Belgium',
  'Czechia',
  'Iraq',
  'Romania',
  'Chile',
  'Bangladesh',
  'Canada',
  'Philippines',
  'Morocco',
  'Switzerland',
  'Pakistan',
  'Israel',
  'Saudi Arabia',
  'Portugal',
  'Sweden',
  'Austria',
  'Hungary',
  'Serbia',
  'Jordan',
  'Nepal',
  'Ecuador',
  'Georgia',
  'Panama',
  'Azerbaijan',
  'United Arab Emirates',
  'Croatia',
  'Bulgaria',
  'Japan',
  'Belarus',
  'Costa Rica',
  'Armenia',
  'Lebanon',
  'Bolivia',
  'Kuwait',
  'Kazakhstan',
  'Slovakia',
  'Qatar',
  'Moldova',
  'Guatemala',
  'Greece',
  'Denmark',
  'Egypt',
  'Ethiopia',
  'Honduras',
  'Tunisia',
  'Venezuela',
  'Bosnia and Herzegovina',
  'Lithuania',
  'Slovenia'
];

const covidAPIURL = 'https://corona.lmao.ninja/v2/countries';

class Country{
  final String country;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int todayRecovered;
  final int tests;
  final int population;
  final String updatedDate;

  Country(this.country, this.cases, this.todayCases, this.deaths, this.todayDeaths,
      this.recovered, this.todayRecovered, this.tests, this.population,this.updatedDate);


}

Future<Country> fetchCountry(String country) async {
  Country newCountry;
  DateFormat formatter = DateFormat("dd MM yyyy");

  try {
    http.Response response = await http.get('$covidAPIURL/$country');
    if (response.statusCode == 200) {
      Map temp = (jsonDecode(response.body));
      newCountry = Country(
          temp['country'],
          temp['cases'],
          temp['todayCases'],
          temp['deaths'],
          temp['todayDeaths'],
          temp['recovered'],
          temp['todayRecovered'],
          temp['tests'],
          temp['population'],
          formatter.format(
              DateTime.fromMillisecondsSinceEpoch(temp['updated'])));
    }
  }catch(e){
     print('Failed to load country statistics');
  }
  return newCountry;
}