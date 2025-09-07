import 'package:flutter/material.dart';
import 'package:news_app/core/gen/assets.gen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.onTap});

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      color: Colors.black,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 200,
            width: double.infinity,
            color: Colors.white,
            child: Text(
              "News App",
              style: theme.textTheme.headlineSmall!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap();
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                spacing: 15,
                children: [
                  ImageIcon(
                    AssetImage(Assets.icons.homeIcon.path),
                    color: Colors.white,
                    size: 30,
                  ),
                  Text(
                    "Go To Home",
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(color: Colors.white, thickness: 2, indent: 20, endIndent: 20),
        ],
      ),
    );
  }
}
