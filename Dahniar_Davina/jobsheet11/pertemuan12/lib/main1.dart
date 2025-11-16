import 'User1.dart';

void main() {
  // Object Dart ke JSON
  User user = User(
    id: 1,
    name: 'Dahniar Davina',
    email: 'dahniar@example.com',
    createdAt: DateTime.now(),
  ); // User

  Map<String, dynamic> userJson = user.toJson();
  print('User JSON: $userJson');

  // JSON ke Object Dart
  Map<String, dynamic> jsonData = {
    'id': 2,
    'name': 'Astrid Andini',
    'email': 'astrid@example.com',
    'created_at': '2025-01-01T10:00:00.000Z',
  };

  User userFromJson = User.fromJson(jsonData);
  print('User from JSON: ${userFromJson.name}');
}
