
// ignore_for_file: camel_case_types

class Activity_Model{
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
    image:"assets/images/mail.png",
    name:"Email verified",
    subtitle:"Your email has been verified!",
    time:"12:00 PM",
  ),
  Activity_Model(
    image:"assets/images/amd.png",
    name:"Price alert!",
    subtitle:"AMD current price is  24.00",
    time:"10:13 AM",
  ),
  Activity_Model(
    image:"assets/images/Chypher.png",
    name:"Price alert!",
    subtitle:"ADA current price is 0.3190",
    time:"10:12 AM",
  ),
  Activity_Model(
    image:"assets/images/coin.png",
    name:"Deposit USD Successfull",
    subtitle:"You have successfully deposited 150.00...",
    time:"Oct 31",
  ),
  Activity_Model(
    image:"assets/images/amazon.png",
    name:"Price Alert!",
    subtitle:"AMZN current price is 112.85",
    time:"Oct 29",
  ),
  Activity_Model(
    image:"assets/images/SOL.png",
    name:"Successfully bought SOL",
    subtitle:"You have successfully purchased SOL 3,567...",
    time:"Oct 15",
  ),
  Activity_Model(
    image:"assets/images/Airbnb.png",
    name:"Successfully bought ABNB",
    subtitle:"You have successfully purchased ABNB 3,567...",
    time:"Oct 11",
  ),
];