import 'package:dizi_film/details.dart';
import 'package:dizi_film/movie.dart';
import 'package:flutter/material.dart';

class CustomCardNormal extends StatelessWidget {
  MovieModel movieModel;
  CustomCardNormal({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailsScreen(),));
        
      },
      child: Stack(
        children: [
          Container(
            height: 200,
            width: 140,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(movieModel.imageAsset!),
                    fit: BoxFit.cover)),
          ),
          Positioned(
              left: 15,
              right: 15,
              bottom: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieModel.movieName!,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.yellow.shade400,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        movieModel.year!,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.yellow.shade400,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieModel.movieRating!,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.yellow,
                      )
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
