// ignore_for_file: file_names

class TransactionModel {
  String image;
  String name;
  String time;
  String percentage;
  String ruppes;

  TransactionModel({
    required this.image,
    required this.name,
    required this.time,
    required this.percentage,
    required this.ruppes,
  });
}

List<TransactionModel> transactionDetail = [
  TransactionModel(
    image: "assets/images/amazon.png",
    name: "Send (AMZN)",
    time: "7:00 PM",
    percentage: "-4.00",
    ruppes:"\$422.00",
  ),
  TransactionModel(
    image: "assets/images/Apple_1.png",
    name: "Buy AAPL",
    time: "APPLE",
    percentage: "0.24%",
    ruppes:"\$422.00",
  ),
  TransactionModel(
    image: "assets/images/cardano.png",
    name: "CARDANO",
    time: "cardano",
    percentage: "0.54%",
    ruppes:"\$422.00",
  ),
  TransactionModel(
    image: "assets/images/SOL.png",
    name: "SOL",
    time: "sol",
    percentage: "0.14%",
    ruppes:"\$422.00",
  ),
  TransactionModel(
    image: "assets/images/SHIB.png",
    name: "SHIB",
    time: "shib",
    percentage: "0.44%",
    ruppes:"\$422.00",
  ),
  TransactionModel(
    image: "assets/images/S_P.png",
    name: "S_P",
    time: "sp",
    percentage: "0.50%",
    ruppes:"\$422.00",
  ),
  TransactionModel(
    image: "assets/images/UBS.png",
    name: "UBS",
    time: "ubs",
    percentage: "0.55%",
    ruppes:"\$422.00",
  ),
  TransactionModel(
    image: "assets/images/Utilities.png",
    name: "Utilities",
    time: "utilities",
    percentage: "0.60%",
    ruppes:"\$422.00",
  ),
];