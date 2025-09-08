import 'package:flutter/material.dart';
import 'package:news_app/modules/home/model/source_data.dart';
import 'package:news_app/modules/home/view_model/settings_provider.dart';
import 'package:provider/provider.dart';

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
    var settingProvider = Provider.of<SettingsProvider>(context);
    var theme = Theme.of(context);
    return Text(
      sourceData.name,
      style: theme.textTheme.titleSmall!.copyWith(
        fontSize: isSelected ? 16 : 14,
        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          color: settingProvider.isDark() ? Colors.white : Colors.black
      ),
    );
  }
}
