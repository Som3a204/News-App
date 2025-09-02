import 'package:flutter/material.dart';
import 'package:news_app/core/constants/assets.dart';
import 'package:news_app/core/gen/assets.gen.dart';
import 'package:news_app/modules/home/model/category_data_model.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
    required this.onTap,
    required this.categoryDataModel,
    required this.index,
  });

  final int index;
  final Function onTap;
  final CategoryDataModel categoryDataModel;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 220,
      alignment: index % 2 == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: AssetImage(categoryDataModel.image),
          fit: BoxFit.cover,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          onTap(categoryDataModel);
        },
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white54,
          ),
          child: Directionality(
            textDirection:
                index % 2 == 0 ? TextDirection.ltr : TextDirection.rtl,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("View All", style: theme.textTheme.headlineSmall),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.arrow_forward_ios, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
