import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final String email,fname, lname, phone, address,avatar;
  final int id;
  User({
    required this.email,
    required this.id,
    required this.fname,
    required this.lname,
    required this.phone,
    required this.address,
    required this.avatar,
  });
  //static Future<void> fetchUser(String email) async
  static Future<User> fetchUser(String email) async {
    final url = Uri.parse('http://192.168.1.9:3000/users');
    final headers = {'Content-Type': 'application/json'};

    final response = await http.get(url, headers: headers);
    
 if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final user = data.firstWhere((item) => item['email'] == email);
    
      if (user is Map<String, dynamic>) {
        return User(
          email: user['email'],
          id: user['user_id'],
          fname: user['fname'],
          lname: user['lname'],
          phone: user['phone'],
          address: user['address'],
          avatar: user['avatar'],
        );
      } else {
        throw Exception('Data is not a Map<String, dynamic>');
      }
    } else {
      print('Failed to load data: ${response.statusCode}');
      throw Exception('Failed to load data');
    }
  }
  
}

User? user;


//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final user = data.firstWhere((item) => item['email'] == email);
//       print(user);
//       if (user is List<dynamic>) {
//         users = user.map((item) {
//           return User(
//             fname: item['fname'],
//             lname: item['lname'],
//             phone: item['phone'],
//             address: item['address'],
//           );
//         }).toList();
//       } else {
//         throw Exception('Data is not a List<dynamic>');
//       }
//     } else {
//       print('Failed to load data: ${response.statusCode}');
//     }
//   }
  
// }

// List<User> users = [];