import 'package:dizi_film/movie.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<MovieModel> popularItems = List.of(popularImages);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.transparent
                    ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage(popularItems[0].imageAsset.toString()),
                          fit: BoxFit.cover)),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "deneme",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "2021, asededede",
                                style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "9.9",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTag("Epic"),
                          const SizedBox(
                            width: 10,
                          ),
                          buildTag("Fantasy"),
                          const SizedBox(
                            width: 10,
                          ),
                          buildTag("Drama"),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "asdasdasdasdasdasdasd",
                          style: TextStyle(
                              color: Colors.white24,
                              height: 1.5,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Comments",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            buildCommentCard(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 60,
            right: 20,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white70
              ),
              child: IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back)),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTag(String title) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade600,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }

  Widget buildCommentCard() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 160,
      child: ListView.builder(
        itemCount: popularItems[0].comments!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade800),
            margin: const EdgeInsets.only(right: 15),
            padding: const EdgeInsetsDirectional.symmetric(
                vertical: 15, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(popularItems[0]
                                    .comments![index]['imageUrl']
                                    .toString()),
                              )),
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(popularItems[0].comments![index]['name'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            const SizedBox(height: 5,),
                            Text(popularItems[0].comments![index]['date'],
                            style: const TextStyle(
                              color: Colors.white60
                            ),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          popularItems[0].comments![index]['rating'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(Icons.star,color: Colors.yellow,size: 15,)
                      ],
                    )
                  ],
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(popularItems[0].comments![index]['comment'],
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
