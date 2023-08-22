import 'package:flutter/material.dart';
import 'package:sip_app/modules/common/screens/default_layout.dart';
import 'package:sip_app/constants/colors.dart';
import 'package:sip_app/modules/common/widgets/back_appbar.dart';
import 'package:sip_app/modules/common/widgets/category_appbar.dart';
import 'package:sip_app/modules/market/widgets/markets_view.dart';

class MarketsScreen extends StatelessWidget {
  const MarketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: BackAppBar(title: '시장 전체 보기'),
      child: MarketsView(),
      // backgroundColor: PRIMARY_BACKGROUND_COLOR,
    );
  }
}
