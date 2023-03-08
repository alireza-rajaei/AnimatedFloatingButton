class Person {
  String userName;
  String avatarPath;
  Person({
    required this.userName,
    required this.avatarPath,
  });

  @override
  String toString() => 'Person(userName: $userName, avatarPath: $avatarPath)';

  @override
  bool operator ==(covariant Person other) {
    if (identical(this, other)) return true;

    return other.userName == userName && other.avatarPath == avatarPath;
  }

  @override
  int get hashCode => userName.hashCode ^ avatarPath.hashCode;

  Person copyWith({
    String? userName,
    String? avatarPath,
  }) {
    return Person(
      userName: userName ?? this.userName,
      avatarPath: avatarPath ?? this.avatarPath,
    );
  }
}
