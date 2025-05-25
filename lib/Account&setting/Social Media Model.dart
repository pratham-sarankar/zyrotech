// ignore_for_file: file_names, camel_case_types
class SocialMediaModel {
  String image;
  String name;
  String desc;

  SocialMediaModel({
    required this.image,
    required this.name,
    required this.desc,
  });
}

List<SocialMediaModel> socialDetail = [
  SocialMediaModel(
    image: "assets/images/Facebook Outline.png",
    name: "Facebook",
    desc: "connect facebook account",
  ),
  SocialMediaModel(
    image: "assets/images/Instagram Outline.png",
    name: "Instagram",
    desc: "connect instagram account",
  ),
  SocialMediaModel(
    image: "assets/images/Twitter Outline.png",
    name: "Twitter",
    desc: "connect twitter account",
  ),
  SocialMediaModel(
    image: "assets/images/google.png",
    name: "Google",
    desc: "connect google account",
  ),
  SocialMediaModel(
    image: "assets/images/Bitcoin.png",
    name: "Bitcoin",
    desc: "connect bitcoin ",
  ),
];