import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/core/constants/assets.dart';
import 'package:news_app/core/routes/page_route_name.dart';
import 'package:news_app/modules/home/view/category_details_view.dart';
import 'package:news_app/modules/home/view/custom_drawer.dart';
import 'package:news_app/modules/home/view_model/home_view_model.dart';
import 'package:news_app/modules/home/view_model/settings_provider.dart';
import 'package:news_app/modules/home/widgets/category_card_widget.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    var settingProvider = Provider.of<SettingsProvider>(context);
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                provider.selectedCategory == null ? local.home : provider
                    .selectedCategory!.title, style: TextStyle(
                  color: settingProvider.isDark() ? Colors.white : Colors.black
              ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, PageRouteName.search);
                      },
                      child: ImageIcon(AssetImage(AppAssets.searchIcn),
                        color: settingProvider.isDark() ? Colors.white : Colors
                            .black,)),
                ),
              ],
            ),
            drawer: CustomDrawer(
              onTap: () {
                provider.onCategoryClicked();
                Navigator.pop(context);
              },
            ),
            body:
            provider.selectedCategory == null
                ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Good Morning \nHere is Some News For You",
                      style: theme.textTheme.headlineSmall?.copyWith(
                          color: settingProvider.isDark()
                              ? Colors.white
                              : Colors.black
                      ),
                    ),
                    SizedBox(height: 15),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CategoryCardWidget(
                          onTap: provider.onCategoryClicked,
                          index: index,
                          categoryDataModel: provider.categories[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 15);
                      },
                      itemCount: provider.categories.length,
                    ),
                  ],
                ),
              ),
            )
                : CategoryDetailsView(),
          );
        },
      ),
    );
  }
}
