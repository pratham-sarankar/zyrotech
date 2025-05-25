// ignore_for_file: file_names

class CollectionsModel {
  String image;
  String name;
  String desc;
  String money;
  String percentage;
  String icon;

  CollectionsModel({
    required this.image,
    required this.name,
    required this.desc,
    required this.money,
    required this.percentage,
    required this.icon,
  });
}

List<CollectionsModel> collectionDetail = [
  CollectionsModel(
    image: "assets/images/BTC_USDT.png",
    name: "Bitcoin",
    desc: "BTC",
    money: " \$19,075.00",
    icon:"assets/images/up-arrow.png",
    percentage: "0.35%",
  ),
  CollectionsModel(
    image: "assets/images/cardano.png",
    name: "Cardano",
    desc: "ADA",
    money: " \$0,3908",
    percentage: "0.24%",
    icon:"assets/images/up-arrow.png",
  ),
  CollectionsModel(
    image: "assets/images/polygon.png",
    name: "Polygon",
    desc: "Matic",
    money: " \$0,7869",
    percentage: "0.54%",
    icon:"assets/images/up-arrow.png",
  ),
  CollectionsModel(
    image: "assets/images/SOL.png",
    name: "SOL",
    desc: "sol",
    money: " \$0,789",
    percentage: "0.14%",
    icon:"assets/images/up-arrow.png",
  ),
  CollectionsModel(
    image: "assets/images/Visionxxx.png",
    name: "SHIB",
    desc: "shib",
    money: " \$0,2389",
    percentage: "0.44%",
    icon:"assets/images/up-arrow.png",
  ),
  CollectionsModel(
    image: "assets/images/S_P.png",
    name: "S_P",
    desc: "sp",
    money: " \$0,8389",
    percentage: "0.50%",
    icon:"assets/images/up-arrow.png",
  ),
  CollectionsModel(
    image: "assets/images/UBS.png",
    name: "UBS",
    desc: "ubs",
    money: " \$0,6789",
    percentage: "0.55%",
    icon:"assets/images/up-arrow.png",
  ),
  CollectionsModel(
    image: "assets/images/Utilities.png",
    name: "Utilities",
    desc: "utilities",
    money: " \$0,4589",
    percentage: "0.60%",
    icon:"assets/images/up-arrow.png",
  ),
];