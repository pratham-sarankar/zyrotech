// ignore_for_file: file_names, camel_case_types

class AssetModel {
  String image;
  String name;
  String desc;
  String money;
  String percentage;
  String icon;

  AssetModel({
    required this.image,
    required this.name,
    required this.desc,
    required this.money,
    required this.percentage,
    required this.icon,
  });
}

List<AssetModel> assetDetail = [
  AssetModel(
    image: "assets/images/BTC_USDT.png",
    name: "Bitcoin",
    desc: "BTC",
    money: " \$19,075.00",
    icon:"assets/images/up-arrow.png",
    percentage: "0.35%",
  ),
  AssetModel(
    image: "assets/images/cardano.png",
    name: "Cardano",
    desc: "ADA",
    money: " \$0,3908",
    percentage: "0.24%",
    icon:"assets/images/up-arrow.png",
  ),
  AssetModel(
    image: "assets/images/polygon.png",
    name: "Polygon",
    desc: "Matic",
    money: " \$0,7869",
    percentage: "0.54%",
    icon:"assets/images/up-arrow.png",
  ),
  AssetModel(
    image: "assets/images/SOL.png",
    name: "SOL",
    desc: "sol",
    money: " \$0,789",
    percentage: "0.14%",
    icon:"assets/images/up-arrow.png",
  ),
  AssetModel(
    image: "assets/images/S_P.png",
    name: "SHIB",
    desc: "shib",
    money: " \$0,2389",
    percentage: "0.44%",
    icon:"assets/images/up-arrow.png",
  ),
  AssetModel(
    image: "assets/images/S_P.png",
    name: "S_P",
    desc: "sp",
    money: " \$0,8389",
    percentage: "0.50%",
    icon:"assets/images/up-arrow.png",
  ),
  AssetModel(
    image: "assets/images/UBS.png",
    name: "UBS",
    desc: "ubs",
    money: " \$0,6789",
    percentage: "0.55%",
    icon:"assets/images/up-arrow.png",
  ),
  AssetModel(
    image: "assets/images/Utilities.png",
    name: "Utilities",
    desc: "utilities",
    money: " \$0,4589",
    percentage: "0.60%",
    icon:"assets/images/up-arrow.png",
  ),
];




class AssetModel_ {
  String image;
  String name;
  String desc;
  String money;
  String percentage;

  AssetModel_({
    required this.image,
    required this.name,
    required this.desc,
    required this.money,
    required this.percentage,
  });
}

List<AssetModel_> assetDetail_ = [
  AssetModel_(
    image: "assets/images/Bitcoin.png",
    name: "Bitcoin",
    desc: "BTC",
    money: " 19,075.00",

    percentage: "0.35%",
  ),
  AssetModel_(
    image: "assets/images/cardano.png",
    name: "Cardano",
    desc: "ADA",
    money: " 0,3908",
    percentage: "0.24%",

  ),
  AssetModel_(
    image: "assets/images/polygon.png",
    name: "Polygon",
    desc: "Matic",
    money: " 0,7869",
    percentage: "0.54%",

  ),
  AssetModel_(
    image: "assets/images/SOL.png",
    name: "SOL",
    desc: "sol",
    money: " 0,789",
    percentage: "0.14%",

  ),
  AssetModel_(
    image: "assets/images/SHIB.png",
    name: "SHIB",
    desc: "shib",
    money: " 0,2389",
    percentage: "0.44%",

  ),
  AssetModel_(
    image: "assets/images/S_P.png",
    name: "S_P",
    desc: "sp",
    money: " 0,8389",
    percentage: "0.50%",

  ),
  AssetModel_(
    image: "assets/images/UBS.png",
    name: "UBS",
    desc: "ubs",
    money: " 0,6789",
    percentage: "0.55%",

  ),
  AssetModel_(
    image: "assets/images/Utilities.png",
    name: "Utilities",
    desc: "utilities",
    money: " 0,4589",
    percentage: "0.60%",

  ),
];