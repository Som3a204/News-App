import 'package:flutter/material.dart';
import 'package:news_app/modules/home/model/source_data.dart';

class TabBarItemWidget extends StatelessWidget {
  const TabBarItemWidget({
    super.key,
    required this.sourceData,
    required this.isSelected,
  });

  final SourceData sourceData;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Text(
      sourceData.name,
      style: theme.textTheme.titleSmall!.copyWith(
        fontSize: isSelected ? 16 : 14,
        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
      ),
    );
  }
}
