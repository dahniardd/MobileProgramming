import 'package:pertemuan12/user2.dart';

void main() {
  print("==== DEBUG: Check JSON Structure ====");

  // Object Dart ke JSON
  User user = User(
    id: 1,
    name: 'Dahniar Davina',
    createdAt: DateTime.now(),
  );

  Map<String, dynamic> userJson = user.toJson();
  print('User.toJson() result: $userJson');

  print('Field names: ${userJson.keys.toList()}');

  print("\n==== TEST: JSON to Object ====");

  Map<String, dynamic> jsonData = {
    'id': 2,
    'name': 'Astrid Andini',
    'email': 'astrid@example.com',
    'createdAt': '2024-01-01T10:00:00.000Z',
  };

  print('JSON data to parse: $jsonData');

  try {
    User userFromJson = User.fromJson(jsonData);
    print("✅ SUCCESS: User from JSON: $userFromJson");
  } catch (e, stack) {
    print("❌ ERROR: $e");
    print('Stack trace: $stack');
  }

  print("\n==== TEST: Handle Missing Fields ====");

  Map<String, dynamic> incompleteJson = {
    'id': 3,
    'email': 'test@example.com',
  };

  try {
    User userFromIncomplete = User.fromJson(incompleteJson);
    print("User from incomplete JSON: $userFromIncomplete");
  } catch (e) {
    print("Error with incomplete JSON: $e");
  }
}
