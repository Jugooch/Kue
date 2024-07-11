import '../models/models.dart';

class UserDao {
  // Method to get the user card data from the user model
  UserCardModel getUserCard(UserModel user) {
    return UserCardModel.fromUserModel(user);
  }

  // Example method to get user data from a data source (e.g., Firebase)
  Future<List<UserCardModel>> getUserCardsFromDataSource() async {
    // This is a placeholder for fetching data from your data source
    // Replace this with your actual data fetching logic
    List<UserModel> users = await fetchUsersFromFirebase();

    // Convert each UserModel to UserCardModel
    return users.map((user) => UserCardModel.fromUserModel(user)).toList();
  }

  Future<List<UserModel>> fetchUsersFromFirebase() async {
    // Placeholder for fetching data from Firebase
    // Implement your Firebase fetching logic here
    return [];
  }
}
