import 'package:dizi_film/custom_card.dart';
import 'package:dizi_film/custom_card_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:dizi_film/movie.dart';

class Yenisi extends StatefulWidget {
  const Yenisi({super.key});

  @override
  State<Yenisi> createState() => _YenisiState();
}

class _YenisiState extends State<Yenisi> {
  List<MovieModel> foryouItemsList = List.of(forYouImages);
  List<MovieModel> populerItemsList = List.of(popularImages);
  List<MovieModel> genresItemsList = List.of(genresList);
  List<MovieModel> legendaryItemsList = List.of(legendaryImages);

  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.9);
  int currentPage = 0;

  List<Widget> buildPageIndicatorWidget() {
    List<Widget> list = [];
    for (int i = 0; i < foryouItemsList.length; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white24,
          borderRadius: BorderRadius.circular(20)),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                          vertical: 10, horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Welcome",
                            style: TextStyle(
                                color: Colors.yellow.shade400, fontSize: 30),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: const DecorationImage(
                                      image: AssetImage("assets/ikon_dizi.jpg"),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                  right: 2,
                                  top: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.yellow.shade400),
                                    height: 10,
                                    width: 10,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Search",
                              style: TextStyle(color: Colors.grey.shade900),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      child: Text(
                        "For you",
                        style: TextStyle(
                            color: Colors.yellow.shade400,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    foryoucardLayout(forYouImages),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: buildPageIndicatorWidget(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Popular",
                                style: TextStyle(
                                    color: Colors.yellow.shade400,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    movieListBuilder(populerItemsList),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Genres",
                                style: TextStyle(
                                    color: Colors.yellow.shade400,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    genresBuilder(genresList),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Legendary Movies",
                                style: TextStyle(
                                    color: Colors.yellow.shade400,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    movieListBuilder(legendaryItemsList)
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget foryoucardLayout(List<MovieModel> movieList) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.47,
      child: PageView.builder(
        physics: const ClampingScrollPhysics(),
        controller: pageController,
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return CustomCardThumbnail(
              imageAsset: movieList[index].imageAsset.toString());
        },
        onPageChanged: (int page) {
          setState(() {
            currentPage = page;
          });
        },
      ),
    );
  }

  Widget movieListBuilder(List<MovieModel> movieList) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      height: MediaQuery.of(context).size.height * 0.27,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return CustomCardNormal(movieModel: movieList[index]);
        },
      ),
    );
  }

  Widget genresBuilder(List<MovieModel> genresList) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, ),
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
        itemCount: genresList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(
                      genresList[index].imageAsset.toString(),
                    ),
                    fit: BoxFit.cover
                  ),
                ),
                margin: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 30, top: 0),
              ),
              Positioned(child: Text(
                genresList[index].movieName.toString(),
                style: const TextStyle(color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold),))
                
            ],

          );
        },
      ),
    );
  }
}
