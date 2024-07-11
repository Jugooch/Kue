import 'user_model.dart';

class UserCardModel {
  final String firstName;
  final String lastName;
  final int age;
  final List<String> interests;
  final List<String> images;
  final String gender;
  final String sexualOrientation;

  UserCardModel({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.interests,
    required this.images,
    required this.gender,
    required this.sexualOrientation,
  });

  // Create a factory constructor to convert UserModel to UserCardModel
  factory UserCardModel.fromUserModel(UserModel user) {
    return UserCardModel(
      firstName: user.firstName,
      lastName: user.lastName,
      age: user.age,
      interests: user.interests,
      images: user.images,
      gender: user.gender,
      sexualOrientation: user.sexualOrientation,
    );
  }
}
