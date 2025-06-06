// ignore_for_file: file_names, camel_case_types
class ContactModel {
  String image;
  String name;
  String desc;

  ContactModel({
    required this.image,
    required this.name,
    required this.desc,
  });
}

List<ContactModel> contactDetail = [
  ContactModel(
    image: "assets/images/Krishna.jpg",
    name: "Aileen Full bright",
    desc: "+1 7896 8797 908.",
  ),
  ContactModel(
    image: "assets/images/Krishna1.png",
    name: "Leif Floyd",
    desc: "+7 445 553 3864",
  ),
];


class ContactModel_ {
  String image_;
  String name_;
  String desc_;

  ContactModel_({
    required this.image_,
    required this.name_,
    required this.desc_,
  });
}

List<ContactModel_> contactDetail_ = [
  ContactModel_(
    image_: "assets/images/Krishna.jpg",
    name_: "Tyra Dhillon",
    desc_: "+995 940 555 766",
  ),
  ContactModel_(
    image_: "assets/images/Krishna1.png",
    name_: "Marielle Wigging",
    desc_: "+56 955 588 939",
  ),
  ContactModel_(
    image_: "assets/images/Krishna.jpg",
    name_: "Freida Varnes",
    desc_: "+226 755 558 14",
  ),
  ContactModel_(
    image_: "assets/images/Krishna1.png",
    name_: "Thad Eddings",
    desc_: "+7 445 556 8337",
  ),

];


