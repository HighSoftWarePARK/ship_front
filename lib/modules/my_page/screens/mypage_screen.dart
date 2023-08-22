import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sip_app/constants/path.dart';
import 'package:sip_app/modules/auth/providers/auth_provider.dart';
import 'package:sip_app/modules/common/screens/default_layout.dart';
import 'package:sip_app/modules/common/widgets/main_bottom_navigationbar.dart';
import 'package:sip_app/modules/my_page/widgets/mypage_view.dart';

class MypageScreen extends ConsumerWidget {
  const MypageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLoggedIn = ref.watch(checkLoggedInProvider);

    return DefaultLayout(
      child: isLoggedIn ? MyPageView() : Center(
        child:GestureDetector(
          onTap: () {
            context.push(PATH_SIGNIN);
          },
          child: Text('로그인 / 회원가입'),
        )
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: MainBottomNavigationBar(bottomTabIndex: 4),
    );
  }
}
