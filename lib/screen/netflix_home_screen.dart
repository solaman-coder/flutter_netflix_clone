import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/Common/utils.dart';
import 'package:netflix_clone/Model/Movie_model.dart';
import 'package:netflix_clone/Services/api_services.dart';

class NetflixhomeScreen extends StatefulWidget {
  const NetflixhomeScreen({super.key});

  @override
  State<NetflixhomeScreen> createState() => _NetflixhomeScreenState();
}

class _NetflixhomeScreenState extends State<NetflixhomeScreen> {
  final ApiServices apiServices = ApiServices();
  late Future<Movie?> movieData;
  @override
  void initState() {
    movieData = apiServices.fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
            child: Row(
              children: [
                Image.asset('assets/images/netflix-PNG.png', height: 50),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, size: 27, color: Colors.white),
                ),
                Icon(Icons.download_sharp, size: 27, color: Colors.white),
                SizedBox(width: 10),
                Icon(Icons.cast, size: 27, color: Colors.white),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
            child: Row(
              children: [
                MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.white38),
                  ),
                  child: Text(
                    'TV Shows',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.white38),
                  ),
                  child: Text(
                    'Movies',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.white38),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    ],
                  ),
                ),
                SizedBox(width: 8),
              ],
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 28),
            child: Stack(
              children: [
                Container(
                  height: 538,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade800),
                  ),
                  child: FutureBuilder(
                    future: movieData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        final movies = snapshot.data!.results;
                        return ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(20),
                          child: PageView.builder(
itemCount: movies.length,
scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final movie = movies[index];
                              return GestureDetector(
                                onTap: () {
                                  
                                },child: Container(
                                  height: 530,
                                  width: 388,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider('$imageUrl${movie.posterPath}'
                                    ),
                                    ),
                                    ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return Center(child: Text('Problem to fetch data'));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
