import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business_logic/cubit/characters_cubit.dart';
import 'package:flutter_breaking/constans/my_colors.dart';
import 'package:flutter_breaking/presentation/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Characters> allCharacters;

  // Widget get child => null;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

Widget buildBlocWidget(){
  return BlocBuilder<CharactersCubit, CharactersState>(
    builder: (context, state ){
if (state is CharactersLoaded){
  allCharacters = (state).characters.cast<Characters>();
return buildLoadedListWidgets();
}else{
return const Center(
  child: CircularProgressIndicator(
    color: MyColors.myYellow,
  ),
);
}
    },
    
    ) ;
}

Widget buildLoadedListWidgets (){
return SingleChildScrollView(
  child: Container(
    color: MyColors.myGray,
    child: Column(
      children: [
        buildCharactersList(),
      ],
    ),
  ),
);
}

Widget buildCharactersList (){
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 2/3,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allCharacters.length,
     itemBuilder: (context, index){
      return  CharacterItem (
        character: allCharacters! [index]);
     });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: MyColors.myYellow,
      title: const Text(
        'Characters',
        style: TextStyle(color: MyColors.myGray),
      ),
    ),
    body: buildBlocWidget(),
    );
  }
}
