import 'package:flutter/material.dart';
import 'package:my_app_test/color_app.dart';

class UserCardWidget extends StatelessWidget {
  final String name;
  final int age;
  final String imageUrl;

  const UserCardWidget({
    super.key,
    required this.age,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 500,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          // color: Colors.lightBlue,
          // color: Color(0xFFEED9C4),
          color: beige,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text("Full name: $name"),
            Text("Age: $age"),

            /// This is an example of asset
            // Image.asset(
            //   height: 200.0,
            //   width: 100.0,
            //   'assets/images/user_image.jpeg',
            // ),
            Image.network(
              height: 200.0,
              width: 100.0,
              imageUrl,
              errorBuilder:
                  (
                    BuildContext context,
                    Object exception,
                    StackTrace? stackTrace,
                  ) {
                    return Text("This is an error in image");
                  },
            ),

            ElevatedButton(
              onPressed: () {
                debugPrint("This button works !");

                // setState(() {
                //   imageUrl =
                //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMIZtXLF7jRJc9_e8557mdOXpMGFH_fZqqXF6PJJo2cw&s=10";
                // });
              },
              child: Text("Change image"),
            ),
          ],
        ),
      ),
    );
  }
}
