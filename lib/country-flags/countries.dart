import 'package:http/http.dart';

Future<List<Country>> getCountries() async {
  final Response response = await get('https://www.worldometers.info/geography/flags-of-the-world/');

  final String data = response.body;

  final List<Country> countries = <Country>[];

  final List<String> parts = data.split('<a href="/img/flags').skip(1).toList();
  for (final String part in parts) {
    final String name = part.split('10px">')[1].split('<')[0];
    final String image = part.substring(0, part.indexOf('"'));

    final Country country = Country(name, image);

    countries.add(country);
  }
  return countries;
}

class Country {
  Country(this.name, this.image);

  final String name;
  final String image;
}
