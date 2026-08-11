import 'package:flutter/material.dart';
import 'package:my_app_test/presentation/widgets/user_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var name = "Manel Kacem";
    var age = 20;
    var imageUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAZXGv2oyDHOeT02-SJvDZlQAYpvEPLj9R1_TNUw5viQ854u5gAhpPlD0&s=10";

    return Scaffold(
      appBar: AppBar(title: Text("App Test")),
      body: UserCardWidget(age: age, name: name, imageUrl: imageUrl),
    );
  }
}
