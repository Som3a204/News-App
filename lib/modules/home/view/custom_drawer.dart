import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/core/constants/assets.dart';
import 'package:news_app/core/gen/assets.gen.dart';
import 'package:news_app/modules/home/view_model/settings_provider.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({super.key, required this.onTap});

  final Function onTap;


  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final List<String> _languages = [
    "English",
    "العربية"
  ];

  final List<String> _themes = [
    "Light",
    "Dark"
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var local = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              width: double.infinity,
              color: Colors.white,
              child: Text(
                local.news_app,
                style: theme.textTheme.headlineSmall!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                widget.onTap();
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
                      local.go_to_home,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
                color: Colors.white, thickness: 2, indent: 20, endIndent: 20),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ImageIcon(
                        AssetImage(AppAssets.themeIcn), color: Colors.white),
                  ),
                  Text(local.theme, style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white
                  ),)
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(8),
                child: CustomDropdown<String>(
                  items: _themes,
                  initialItem: _themes[0],
                  onChanged: (value) {
                    provider.changeTheme(
                        value == "Dark" ? ThemeMode.dark : ThemeMode.light);
                  },
                  decoration: CustomDropdownDecoration(
                      closedFillColor: Colors.transparent,
                      closedBorder: Border.all(
                          color: Colors.white
                      ),
                      closedSuffixIcon: Icon(
                        Icons.arrow_drop_down, size: 30, color: Colors.white,),
                      headerStyle: theme.textTheme.titleLarge?.copyWith(
                          color: Colors.white
                      )
                  ),
                )
            ),
            SizedBox(height: 15),
            Divider(
                color: Colors.white, thickness: 2, indent: 20, endIndent: 20),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ImageIcon(
                        AssetImage(AppAssets.languageIcn), color: Colors.white),
                  ),
                  Text(
                    local.language, style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white
                  ),)
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(8),
                child: CustomDropdown<String>(
                  items: _languages,
                  initialItem: _languages[0],
                  onChanged: (value) {
                    provider.changeLanguage(value == "English" ? "en" : "ar");
                  },
                  decoration: CustomDropdownDecoration(
                      closedFillColor: Colors.transparent,
                      closedBorder: Border.all(
                          color: Colors.white
                      ),
                      closedSuffixIcon: Icon(
                        Icons.arrow_drop_down, size: 30, color: Colors.white,),
                      headerStyle: theme.textTheme.titleLarge?.copyWith(
                          color: Colors.white
                      )
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
