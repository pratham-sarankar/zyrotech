// ignore_for_file: file_names


class NewsModel {
  String image;
  String name;
  String desc;
  String time;

  NewsModel({
    required this.image,
    required this.name,
    required this.desc,
    required this.time,
  });
}

List<NewsModel> newsDetail = [
  NewsModel(
    image: "assets/images/Coinbase.png",
    name: "Coinbase CEO Armstrong plans \nto sell part of his stake to fu...",
    desc: "The Block",
    time: "2h ago",
  ),
  NewsModel(
    image: "assets/images/amazon.png",
    name: "Market Trying to Relax Even\nthough Economic Threats lurk",
    desc: "The Market",
    time: "3h ago",
  ),
  NewsModel(
    image: "assets/images/Mango hack.png",
    name: "Mango hack drama and other\nmajor crypto stories of the pa...",
    desc: "The Mango",
    time: "4h ago",
  ),
  NewsModel(
    image: "assets/images/SOL.png",
    name: "Coinbase CEO Armstrong plans \nto sell part of his stake to fu...",
    desc: "The SOL",
    time: "2h ago",
  ),
  NewsModel(
    image: "assets/images/SHIB.png",
    name: "Market Trying to Relax Even\nthough Economic Threats lurk",
    desc: "The SHIB",
    time: "6h ago",
  ),
  NewsModel(
    image: "assets/images/S_P.png",
    name: "Mango hack drama and other\nmajor crypto stories of the pa...",
    desc: "The S_P",
    time: "8h ago",
  ),
  NewsModel(
    image: "assets/images/UBS.png",
    name: "Coinbase CEO Armstrong plans \nto sell part of his stake to fu...",
    desc: "The UBS",
    time: "7h ago",
  ),
  NewsModel(
    image: "assets/images/Utilities.png",
    name: "Market Trying to Relax Even\nthough Economic Threats lurk",
    desc: "The Utilities",
    time: "1h ago",
  ),
];