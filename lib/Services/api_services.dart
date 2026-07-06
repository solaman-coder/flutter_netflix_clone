import 'package:http/io_client.dart';
import 'package:netflix_clone/Common/utils.dart';
import 'package:netflix_clone/Model/Movie_model.dart';
import 'package:http/http.dart' as http;

var key = '?api_key=$apiKey';

class ApiServices {
  // now playing movies
  Future<Movie?> fetchMovies() async {
    try {
      const endPoint = 'movie/now_playing';
      final apiUrl = '$baseUrl$endPoint$key';
      print(apiUrl);
      final response = await http.get(Uri.parse(apiUrl));
//       final response = await http.get(
//   Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
// );
      print(response.statusCode);
print(response.body);
      if (response.statusCode == 200) {
        return movieFromJson(response.body);
      } else {
        throw Exception('Failed to load movies');
      }
    // } catch (e) {
    //   print('Error fetching movies :$e');
    //   return null;
    // }
    }catch (e, stackTrace) {
  print(e);
  print(stackTrace);
  return null;
}
  } 
// Future<Movie?> fetchMovies() async {
//   const endPoint = 'movie/now_playing';
//   final apiUrl = '$baseUrl$endPoint$key';

//   print(apiUrl);

//   final response = await http.get(Uri.parse(apiUrl));

//   print(response.statusCode);
//   print(response.body);

//   return null;
// }


// Future<Movie?> fetchMovies() async {
//   const endPoint = 'movie/now_playing';
//   final apiUrl = '$baseUrl$endPoint$key';

//   print(apiUrl);

//   final client = IOClient();

//   try {
//     final response = await client
//         .get(Uri.parse(apiUrl))
//         .timeout(const Duration(seconds: 10));

//     print("STATUS: ${response.statusCode}");
//     print(response.body);
//   } catch (e) {
//     print("ERROR:");
//     print(e);
//   } finally {
//     client.close();
//   }

//   return null;
// }
}
