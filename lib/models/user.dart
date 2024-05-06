// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class Userdefine {
//   final String fname, lname , avatar;
//   final int phone;


//   Userdefine(
//     {
//       required this.fname,
//       required this.lname,
//       required this.phone,
//       required this.avatar,

//     }
//   );

  
//   static Future<void> fetchProfile(String email) async {
//     final url = Uri.parse('http://192.168.1.9:3000/users');
//     final headers = {'Content-Type': 'application/json'};

//     final response = await http.get(url, headers: headers);
 

//   if (response.statusCode == 200) {
//   final data = jsonDecode(response.body);
//   final user = data.firstWhere((item) => item['email'] == email);
//   if (data is List<dynamic>) {
//     users = data.map((item) {
//         return Userdefine(
//           fname: item['fname'],
//           lname: item['lname'],
//           phone: item['phone'],
//           avatar: item['avatar'],
        
//         );
      
//     }).toList();
//   } else {
//     throw Exception('Data is not a List<dynamic>');
//   }
// } else {
//   print('Failed to load data: ${response.statusCode}');
// }

//   }
// }

//  List<Userdefine> users = [];