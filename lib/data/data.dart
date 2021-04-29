import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';
import 'package:flutter_netflix_responsive_ui/models/models.dart';

final Content sintelContent = Content(
  name: 'Sintel',
  imageUrl: Assets.sintel,
  titleImageUrl: Assets.sintelTitle,
  videoUrl: Assets.sintelVideoUrl,
  description:
      'A lonely young woman, Sintel, helps and befriends a dragon,\nwhom she calls Scales. But when he is kidnapped by an adult\ndragon, Sintel decides to embark on a dangerous quest to find\nher lost friend Scales.',
);

final List<Content> previews = const [
  Content(
    name: 'Avatar The Last Airbender',
    imageUrl: Assets.atla,
    color: Colors.orange,
    titleImageUrl: Assets.atlaTitle,
  ),
  Content(
    name: 'The Crown',
    imageUrl: Assets.crown,
    color: Colors.red,
    titleImageUrl: Assets.crownTitle,
  ),
  Content(
    name: 'The Umbrella Academy',
    imageUrl: Assets.umbrellaAcademy,
    color: Colors.yellow,
    titleImageUrl: Assets.umbrellaAcademyTitle,
  ),
  Content(
    name: 'Carole and Tuesday',
    imageUrl: Assets.caroleAndTuesday,
    color: Colors.lightBlueAccent,
    titleImageUrl: Assets.caroleAndTuesdayTitle,
  ),
  Content(
    name: 'Black Mirror',
    imageUrl: Assets.blackMirror,
    color: Colors.green,
    titleImageUrl: Assets.blackMirrorTitle,
  ),
  Content(
    name: 'Avatar The Last Airbender',
    imageUrl: Assets.atla,
    color: Colors.orange,
    titleImageUrl: Assets.atlaTitle,
  ),
  Content(
    name: 'The Crown',
    imageUrl: Assets.crown,
    color: Colors.red,
    titleImageUrl: Assets.crownTitle,
  ),
  Content(
    name: 'The Umbrella Academy',
    imageUrl: Assets.umbrellaAcademy,
    color: Colors.yellow,
    titleImageUrl: Assets.umbrellaAcademyTitle,
  ),
  Content(
    name: 'Carole and Tuesday',
    imageUrl: Assets.caroleAndTuesday,
    color: Colors.lightBlueAccent,
    titleImageUrl: Assets.caroleAndTuesdayTitle,
  ),
  Content(
    name: 'Black Mirror',
    imageUrl: Assets.blackMirror,
    color: Colors.green,
    titleImageUrl: Assets.blackMirrorTitle,
    videoUrl: Assets.blackMirrorVideoUrl,
  ),
];
final List<Content> previews1 = const [
  Content(
      name: 'Shutter Island',
      imageUrl: Assets.shutterIsland,
      color: Colors.white,
      videoUrl: Assets.shutterIslandVideoUrl),
  Content(
      name: 'Artemis Fowl',
      imageUrl: Assets.artemisFowl,
      color: Colors.white,
      videoUrl: Assets.artemisFowlVideoUrl),
  Content(
      name: 'Ava',
      imageUrl: Assets.ava,
      color: Colors.white,
      videoUrl: Assets.avaVideoUrl),
  Content(
      name: 'Bad Boys',
      imageUrl: Assets.badBoysForLife,
      color: Colors.white,
      videoUrl: Assets.badBoysForLifeVideoUrl),
  Content(
      name: 'Birds of Prey',
      imageUrl: Assets.birdsOfPrey,
      color: Colors.white,
      videoUrl: Assets.birdsOfPreyVideoUrl),
  Content(
      name: 'Mortal Kombat',
      imageUrl: Assets.mortalKombat,
      color: Colors.white,
      videoUrl: Assets.mortalKombatVideoUrl),
  Content(
      name: 'Source Code',
      imageUrl: Assets.sourceCode,
      color: Colors.white,
      videoUrl: Assets.sourceCodeVideoUrl),
  Content(
      name: 'The Grudge',
      imageUrl: Assets.theGrudge,
      color: Colors.white,
      videoUrl: Assets.theGrudge),
  Content(
      name: 'The New Mutants',
      imageUrl: Assets.theNewMutants,
      color: Colors.white,
      videoUrl: Assets.theNewMutantsVideoUrl),
  Content(
      name: 'The Old Guard',
      imageUrl: Assets.theOldGuard,
      color: Colors.white,
      videoUrl: Assets.theOldGuardVideoUrl),
];
final List<Content> myList = const [
  Content(name: 'Violet Evergarden', imageUrl: Assets.violetEvergarden),
  Content(name: 'How to Sell Drugs Online (Fast)', imageUrl: Assets.htsdof),
  Content(name: 'Kakegurui', imageUrl: Assets.kakegurui),
  Content(name: 'Carole and Tuesday', imageUrl: Assets.caroleAndTuesday),
  Content(name: 'Black Mirror', imageUrl: Assets.blackMirror),
  Content(name: 'Violet Evergarden', imageUrl: Assets.violetEvergarden),
  Content(name: 'How to Sell Drugs Online (Fast)', imageUrl: Assets.htsdof),
  Content(name: 'Kakegurui', imageUrl: Assets.kakegurui),
  Content(name: 'Carole and Tuesday', imageUrl: Assets.caroleAndTuesday),
  Content(name: 'Black Mirror', imageUrl: Assets.blackMirror),
];
final List<Content> myList1 = const [
  Content(
      name: 'The Social Network',
      imageUrl: Assets.theSocialNetwork,
      videoUrl: Assets.theSocialNetworkVideoUrl),
  Content(
      name: 'Artemis Fowl',
      imageUrl: Assets.artemisFowl,
      videoUrl: Assets.artemisFowlVideoUrl),
  Content(name: 'Ava', imageUrl: Assets.ava, videoUrl: Assets.avaVideoUrl),
  Content(
      name: 'Bad Boys',
      imageUrl: Assets.badBoysForLife,
      videoUrl: Assets.badBoysForLifeVideoUrl),
  Content(
      name: 'Birds of Prey',
      imageUrl: Assets.birdsOfPrey,
      videoUrl: Assets.birdsOfPreyVideoUrl),
  Content(
      name: 'Mortal Kombat',
      imageUrl: Assets.mortalKombat,
      videoUrl: Assets.mortalKombatVideoUrl),
  Content(
      name: 'Source Code',
      imageUrl: Assets.sourceCode,
      videoUrl: Assets.sourceCodeVideoUrl),
  Content(
      name: 'The Grudge',
      imageUrl: Assets.theGrudge,
      videoUrl: Assets.theGrudge),
  Content(
      name: 'The New Mutants',
      imageUrl: Assets.theNewMutants,
      videoUrl: Assets.theNewMutantsVideoUrl),
  Content(
      name: 'The Old Guard',
      imageUrl: Assets.theOldGuard,
      videoUrl: Assets.theOldGuardVideoUrl),
];

final List<Content> originals = const [
  Content(name: 'Stranger Things', imageUrl: Assets.strangerThings),
  Content(name: 'The Witcher', imageUrl: Assets.witcher),
  Content(name: 'The Umbrella Academy', imageUrl: Assets.umbrellaAcademy),
  Content(name: '13 Reasons Why', imageUrl: Assets.thirteenReasonsWhy),
  Content(name: 'The End of the F***ing World', imageUrl: Assets.teotfw),
  Content(name: 'Stranger Things', imageUrl: Assets.strangerThings),
  Content(name: 'The Witcher', imageUrl: Assets.witcher),
  Content(name: 'The Umbrella Academy', imageUrl: Assets.umbrellaAcademy),
  Content(name: '13 Reasons Why', imageUrl: Assets.thirteenReasonsWhy),
  Content(name: 'The End of the F***ing World', imageUrl: Assets.teotfw),
];

final List<Content> trending = const [
  Content(name: 'Explained', imageUrl: Assets.explained),
  Content(name: 'Avatar The Last Airbender', imageUrl: Assets.atla),
  Content(name: 'Tiger King', imageUrl: Assets.tigerKing),
  Content(name: 'The Crown', imageUrl: Assets.crown),
  Content(name: 'Dogs', imageUrl: Assets.dogs),
  Content(name: 'Explained', imageUrl: Assets.explained),
  Content(name: 'Avatar The Last Airbender', imageUrl: Assets.atla),
  Content(name: 'Tiger King', imageUrl: Assets.tigerKing),
  Content(name: 'The Crown', imageUrl: Assets.crown),
  Content(name: 'Dogs', imageUrl: Assets.dogs),
];
