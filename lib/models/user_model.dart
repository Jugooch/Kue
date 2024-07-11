class UserModel {
  final String firstName;
  final String lastName;
  final int age;
  final String email;
  final String password;
  final List<String> interests;
  final List<String> images;
  final String gender;
  final String sexualOrientation;
  final String preference;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.email,
    required this.password,
    required this.interests,
    required this.images,
    required this.gender,
    required this.sexualOrientation,
    required this.preference,
  });
}
