import 'package:flutter/material.dart';
import 'package:news_app/modules/home/model/source_data.dart';

class TabBarItemWidget extends StatefulWidget {
  const TabBarItemWidget({
    super.key,
    required this.sourceData,
    required this.isSelected,
  });

  final SourceData sourceData;
  final bool isSelected;

  @override
  State<TabBarItemWidget> createState() => _TabBarItemWidgetState();
}

class _TabBarItemWidgetState extends State<TabBarItemWidget> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Text(
      widget.sourceData.name,
      style: theme.textTheme.titleSmall!.copyWith(
        fontSize: widget.isSelected ? 16 : 14,
        fontWeight: widget.isSelected ? FontWeight.w700 : FontWeight.w500,
      ),
    );
  }
}
