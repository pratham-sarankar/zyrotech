// ignore_for_file: camel_case_types

class Activity_Model {
  String image;
  String name;
  String subtitle;
  String time;

  Activity_Model({
    required this.image,
    required this.name,
    required this.subtitle,
    required this.time,
  });
}

List<Activity_Model> model = [
  Activity_Model(
    image: "assets/images/mail.png",
    name: "Email verified",
    subtitle: "Your email has been verified!",
    time: "12:00 PM",
  ),
];
