class MovieModel {
  String? imageAsset;
  String? movieName;
  String? movieRating;
  String? year;
  final List<Map>? cast;
  final List<Map>? comments;
  MovieModel(
      {this.imageAsset,
      this.movieName,
      this.movieRating,
      this.year,
      this.comments,
      this.cast});
}

final forYouImages = [
  MovieModel(imageAsset: "assets/gladyator.jpg"),
  MovieModel(imageAsset: "assets/godfather.jpg"),
  MovieModel(imageAsset: "assets/karasovalye.jpg"),
  MovieModel(imageAsset: "assets/yeesilyol.jpg"),
  MovieModel(imageAsset: "assets/filadam.jpg"),
];

final popularImages = [
  MovieModel(
      imageAsset: "assets/filadam.jpg",
      movieName: "Elephant Man",
      cast: [
        {
          "name": "John Merrick",
          "role": "David Lynch",
          "image": "assets/yeesilyol.jpg"
        },
        {
          "name": "John Merrick",
          "role": "David Lynch",
          "image": "assets/yeesilyol.jpg"
        },
        {
          "name": "John Merrick",
          "role": "David Lynch",
          "image": "assets/yeesilyol.jpg"
        },
        {
          "name": "John Merrick",
          "role": "David Lynch",
          "image": "assets/yeesilyol.jpg"
        },
        {
          "name": "John Merrick",
          "role": "David Lynch",
          "image": "assets/yeesilyol.jpg"
        }
      ],
      comments: [
        {
          "name": "John Merrick",
          "imageUrl": "assets/yeesilyol.jpg",
          "date": "Nov 4, 2000",
          "rating": "9.9",
          "comment": "Çok iyi bi film"
        },
        {
          "name": "John Merrick",
          "imageUrl": "assets/yeesilyol.jpg",
          "date": "Nov 4, 2000",
          "rating": "9.9",
          "comment": "Çok iyi bi film"
        },
        {
          "name": "John Merrick",
          "imageUrl": "assets/yeesilyol.jpg",
          "date": "Nov 4, 2000",
          "rating": "9.9",
          "comment": "Çok iyi bi film"
        },
      ],
      year: "2021",
      movieRating: "8.3"),
  MovieModel(
      imageAsset: "assets/dorduncu.jpg",
      movieName: "Deneme",
      year: "2024",
      movieRating: "9.9"),
  MovieModel(
      imageAsset: "assets/dorduncu.jpg",
      movieName: "Deneme",
      year: "2024",
      movieRating: "9.9"),
  MovieModel(
      imageAsset: "assets/dorduncu.jpg",
      movieName: "Deneme",
      year: "2024",
      movieRating: "9.9"),
  MovieModel(
      imageAsset: "assets/dorduncu.jpg",
      movieName: "Deneme",
      year: "2024",
      movieRating: "9.9"),
];
final legendaryImages = [
  MovieModel(
      imageAsset: "assets/dorduncu.jpg",
      movieName: "Deneme",
      year: "2024",
      movieRating: "9.9"),
  MovieModel(
      imageAsset: "assets/dorduncu.jpg",
      movieName: "Deneme",
      year: "2024",
      movieRating: "9.9"),
  MovieModel(
      imageAsset: "assets/dorduncu.jpg",
      movieName: "Deneme",
      year: "2024",
      movieRating: "9.9"),
  MovieModel(
      imageAsset: "assets/dorduncu.jpg",
      movieName: "Deneme",
      year: "2024",
      movieRating: "9.9"),
];

final genresList = [
  MovieModel(movieName: "Deneme", imageAsset: "assets/ikinci.jpg"),
  MovieModel(movieName: "Deneme", imageAsset: "assets/ucuncu.jpg"),
  MovieModel(movieName: "Deneme", imageAsset: "assets/ucuncu.jpg"),
  MovieModel(movieName: "Deneme", imageAsset: "assets/ucuncu.jpg"),
  MovieModel(movieName: "Deneme", imageAsset: "assets/ucuncu.jpg"),
];
