// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:floating_animation/data/model/person.dart';

class Post {
  Person? person;
  String? imagePath;
  Post({
    this.person,
    this.imagePath,
  });

  Post copyWith({
    Person? person,
    String? imagePath,
  }) {
    return Post(
      person: person ?? this.person,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  String toString() => 'Post(person: $person, imagePath: $imagePath)';

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.person == person && other.imagePath == imagePath;
  }

  @override
  int get hashCode => person.hashCode ^ imagePath.hashCode;
}
