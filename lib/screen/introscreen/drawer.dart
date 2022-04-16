import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerWdget extends StatelessWidget {
  static const int setteings = 1;
  static const int category = 2;
  Function onsideDrawer;
  DrawerWdget(this.onsideDrawer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 64),
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          child: const Center(
              child: Text(
            "news app",
            style: TextStyle(color: Colors.white, fontSize: 32),
          )),
        ),
        InkWell(
          onTap: () {
            onsideDrawer(category);
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: const [
                Icon(Icons.list_outlined),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Categories",
                  style: TextStyle(color: Colors.black, fontSize: 21),
                )
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 2,
        ),
        InkWell(
          onTap: () {
            onsideDrawer(setteings);
          },
          child: Row(
            children: const [
              Icon(Icons.settings),
              SizedBox(
                width: 4,
              ),
              Text("Settings",
                  style: TextStyle(color: Colors.black, fontSize: 21))
            ],
          ),
        ),
      ],
    );
  }
}
