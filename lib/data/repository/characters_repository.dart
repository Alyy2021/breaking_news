import 'package:flutter_breaking/data/models/characters.dart';
import 'package:flutter_breaking/data/wep_services_API/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices characterswebservices;

  CharactersRepository(this.characterswebservices);


Future<List<Character>> getAllCharacters() async {
  final characters = await characterswebservices.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();

}


}
