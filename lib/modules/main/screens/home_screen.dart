import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sip_app/modules/common/screens/default_layout.dart';
import 'package:sip_app/constants/colors.dart';
import 'package:sip_app/constants/path.dart';
import 'package:sip_app/modules/common/widgets/main_appbar.dart';
import 'package:sip_app/modules/common/widgets/main_bottom_navigationbar.dart';
import 'package:sip_app/modules/main/providers/main_provider.dart';
import 'package:sip_app/modules/main/widgets/banners_view.dart';
import 'package:sip_app/modules/main/widgets/categories_view.dart';
import 'package:sip_app/modules/main/widgets/communities_view.dart';
import 'package:sip_app/modules/main/widgets/market_intro_view.dart';
import 'package:sip_app/modules/main/widgets/power_experts_view.dart';
import 'package:sip_app/modules/main/widgets/section_view.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(mainFutureProvider);
    return config.when(
        data: (data) {
          return DefaultLayout(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  BannersView(banners: data.banners),
                  SizedBox(height: 40),
                  SectionView(
                    child: CategoriesView(categories: data.mainCategories),
                    label: '창업분야 선택',
                  ),
                  SizedBox(height: 40),
                  SectionView(
                    child: PowerExpertsView(
                      experts: data.powerExperts,
                    ),
                    label: '파워 전문가',
                  ),
                  SizedBox(height: 40),
                  SectionView(
                    child: MarketIntroView(
                      markets: data.markets,
                    ),
                    isNeedRoute: true,
                    routePath: PATH_MARKETS,
                    label: '시장 소개',
                  ),
                  SizedBox(height: 40),
                  CommunitiesView(
                    communities: data.communities,
                  ),
                ],
              ),
            ),
            appBar: MainAppBar(),
            appbarColor: PRIMARY_BACKGROUND_COLOR,
            backgroundColor: PRIMARY_BACKGROUND_COLOR,
            bottomNavigationBar: MainBottomNavigationBar(bottomTabIndex: 0),
            isNeedAppbar: true,
          );
        },
        error: (err, stack) => Text('Error'),
        loading: () => const CircularProgressIndicator());
  }
}
