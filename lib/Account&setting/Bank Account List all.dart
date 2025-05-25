// ignore_for_file: file_names

class BankAccountModel {
  String image;
  String name;
  String desc;

  BankAccountModel({
    required this.image,
    required this.name,
    required this.desc,
  });
}

List<BankAccountModel> bankaccountDetail = [
  BankAccountModel(
    image: "assets/images/Bank America icon.png",
    name: "Bank of America",
    desc: "bankofamerica.com",
  ),
  BankAccountModel(
    image: "assets/images/Barclays outlined.png",
    name: "Barclays",
    desc: "barclays.com",
  ),
  BankAccountModel(
    image: "assets/images/Chase outlined.png",
    name: "Chase",
    desc: "Chase.com",
  ),
  BankAccountModel(
    image: "assets/images/Citi outlined.png",
    name: "Citibank Online",
    desc: "Citibank Online.com",
  ),
  BankAccountModel(
    image: "assets/images/WellsFargo outlined - png.png",
    name: "Wells Fargo",
    desc: "Wells Fargo.com",
  ),
  BankAccountModel(
    image: "assets/images/UBS.png",
    name: "UBS",
    desc: "UBS.com",
  ),
  BankAccountModel(
    image: "assets/images/Bitcoin.png",
    name: "Bitcoin",
    desc: "bit",
  ),
  BankAccountModel(
    image: "assets/images/Utilities.png",
    name: "Utilities",
    desc: "utilities",
  ),
];