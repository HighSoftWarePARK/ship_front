import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sip_app/constants/colors.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(54.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: PRIMARY_BACKGROUND_COLOR,
      automaticallyImplyLeading: false,
      flexibleSpace: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 로고 (40x40)
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/search_view_screen');
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 40,
                    height: 40,
                    child: SvgPicture.asset(
                      'assets/logos/logo_small.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // 버튼 (194x40)
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/search_view_widget');
                  },
                  child: Container(
                    width: 270,
                    height: 40,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'search_view_widget');
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: INPUT_BACKGROUND_GRAY_COLOR,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        side: BorderSide(
                          width: 1.0,
                          color: INPUT_BORDER_GRAY_COLOR,
                        ),
                        padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
                      ).copyWith(
                        overlayColor:
                        MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return INPUT_BACKGROUND_GRAY_COLOR;
                          }
                          return null;
                        }),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 0,
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: SvgPicture.asset(
                                'assets/icons/icon_search.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: const Text(
                                '검색어를 입력해주세요',
                                style: TextStyle(
                                  color: GRAY_COLOR_FONT,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // 빈 공간 추가
                SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}