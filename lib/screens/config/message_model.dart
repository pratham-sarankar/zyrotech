// ignore_for_file: camel_case_types

class MessageModel {
  String image;
  String name;
  String desc;
  String status;
  String message;

  MessageModel({
    required this.image,
    required this.name,
    required this.desc,
    required this.status,
    required this.message,
  });
}

List<MessageModel> messageDetail = [
  MessageModel(
    image: "assets/images/Krishna.jpg",
    name: "Marielle Wigington",
    desc: "You sent a gift.",
    status: "Now",
    message: "2",
  ),
  MessageModel(
    image: "assets/images/Krishna1.png",
    name: "Tyra Dhillon",
    desc: "You sent a gift.",
    status: "12:50 PM",
    message: "3",
  ),
];


class MessageModel_1 {
  String image_;
  String name_;
  String desc_;
  String status_;

  MessageModel_1({
    required this.image_,
    required this.name_,
    required this.desc_,
    required this.status_,
  });
}
List<MessageModel_1> messageDetail_ = [
  MessageModel_1(
    image_: "assets/images/Krishna.jpg",
    name_: "Marci Senter",
    desc_: "Hi Helene! I’d love to hear more about...",
    status_: "Yesterday",

  ),
  MessageModel_1(
    image_: "assets/images/Krishna1.png",
    name_: "Rochel Foosen",
    desc_: "Wall Street drop out turned coder. Paid off....",
    status_: "Oct 15",
  ),
  MessageModel_1(
    image_: "assets/images/Krishna.jpg",
    name_: "Rodolfo Gooden",
    desc_: "You sent a gift.",
    status_: "Oct 10",
  ),
  MessageModel_1(
    image_: "assets/images/Krishna1.png",
    name_: "Charolette Hanlin",
    desc_: "I’m Charolette! My first investment...",
    status_: "Sep 29",
  ),
  MessageModel_1(
    image_: "assets/images/Krishna.jpg",
    name_: "Titus Kitamura",
    desc_: "You sent a gift.",
    status_: "Sep 15",
  ),
];
