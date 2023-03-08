import 'package:floating_animation/data/model/post.dart';

import '../data/model/person.dart';

mixin AppConstant {
  static var personsName = [
    'diva_Z',
    'sweet_kristy',
    'kristy_honey',
    'bubbly_snowflake',
    'cuddle_kitty',
    'honey_bubbly'
  ];

  static List<Person> persons = List<Person>.generate(
      6,
      (index) => Person(
          userName: AppConstant.personsName[index],
          avatarPath: 'assets/imgs/person${index + 1}.jpeg'));

  static List<Post> post = List<Post>.generate(
      3,
      (index) => Post(
          person: persons[3 + index],
          imagePath: 'assets/imgs/post${index + 1}.jpg'));
}
