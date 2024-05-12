// Define your UserData model class
class UserData {
  final String fname;
  final String lname;
  final String email;
  final String password;
  // Add more fields as per your Firestore document

  UserData({
    required this.fname,
    required this.lname,
    required this.email,
    required this.password,
    // Add more fields as per your Firestore document
  });

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      fname: map['FirstName'] ?? '',
      lname: map['LastName'] ?? '',
      email: map['Email'] ?? '',
      password: map['Password'] ?? '',
      // Add more fields as per your Firestore document
    );
  }
}