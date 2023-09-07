import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sip_app/commons/auth/auth_service.dart';
import 'package:sip_app/constants/colors.dart';
import 'package:sip_app/constants/path.dart';
import 'package:sip_app/modules/auth/providers/auth_provider.dart';
import 'package:sip_app/modules/auth/providers/signin_email_provider.dart';
import 'package:sip_app/modules/auth/providers/signin_provider.dart';
import 'package:sip_app/modules/auth/widgets/signin_email_input_widget.dart';
import 'package:sip_app/modules/auth/widgets/signin_password_input_widget.dart';
import 'package:sip_app/utils/jwt.dart';
///로그인 화면을 구성하는 코드


//로그인 화면의 전체 컨텐츠를 포함

class SigninView extends StatelessWidget {
  const SigninView({Key? key}) : super(key: key);

  //SigninLogo 위젯과 SigninForm 위젯을 자식으로 포함
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [const SigninLogo(), SigninForm()],
      ),
    ));
  }
}
//로그인 화면 상단에 로고 이미지를 표시하는 위젯
class SigninLogo extends StatelessWidget {
  const SigninLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: SvgPicture.asset(
            'assets/logos/logo_sip.svg',
            width: 80,
            height: 80,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: SvgPicture.asset(
            'assets/logos/logo_sip_short_ko.svg',
            width: 62.1,
            height: 29.61,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 36),
          child: SvgPicture.asset(
            'assets/logos/logo_sip_long_ko.svg',
            width: 146.82,
            height: 13.08,
          ),
        ),
      ],
    );
  }
}
//실제 로그인 폼을 구성하는 위젯
//ConsumerWidget을 사용하여 상태 관리에 접근
class SigninForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
// 실제 로그인 폼을 구성하는 위젯
  SigninForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,//폼의 상태를 관리하기 위한 GlobalKey
      child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                '아이디',
                style: TextStyle(
                    color: SECTION_FONT_COLOR,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )),
          const SizedBox(height: 10),
          SigninEmailInput(), // 이메일을 입력할 수 있는 커스텀 위젯
          const SizedBox(height: 20),
          Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                '비밀번호',
                style: TextStyle(
                    color: GRAY_COLOR_FONT,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              )),
          const SizedBox(height: 10),
          SigninPasswordInput(), // 비밀번호를 입력할 수 있는 커스텀 위젯
          const SizedBox(height: 20),

          // 로그인 버튼
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(bottom: 20),
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                // TODO: 로그인 버튼 클릭 시 동작 구현
                ref.read(signinProvider.notifier).onSignin(context);
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(fontSize: 20), // 텍스트 스타일
                  minimumSize: const Size(double.infinity, 0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: double.infinity,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 4),
                    child: const Text(
                      '로그인',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          Container(
              width: MediaQuery.of(context).size.width,
              height: 48,
              margin: const EdgeInsets.only(bottom: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      onPressed: () {
                        // TODO: 회원가입 버튼 클릭 시 동작 구현

                      },
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        side:
                            const BorderSide(width: 1.0, color: Colors.black12),
                      ),
                      child: const Text('회원가입',
                          style: TextStyle(
                              color: TEXT_PRIMARY_COLOR,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        side:
                            const BorderSide(width: 1.0, color: Colors.black12),
                      ),
                      child: const Text(
                        '아이디/비밀번호 찾기',
                        style: TextStyle(
                            color: TEXT_PRIMARY_COLOR,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              )),

          // 네이버 로그인
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(bottom: 20),
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState != null) {
                  // TODO: 네이버 로그인 버튼 클릭 시 동작 구현
                }
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500), // 텍스트 스타일
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/icon_naver_login.svg',
                      width: 20, height: 20),
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    child: const Text(
                      '네이버 로그인',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          // 카카오 로그인
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(bottom: 20),
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState != null) {
                  // TODO: 카카오 로그인 버튼 클릭 시 동작 구현
                }
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(
                      fontSize: 20, color: Colors.black), // 텍스트 스타일
                  backgroundColor: Colors.yellow,
                  minimumSize: const Size(double.infinity, 0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/icon_kakao_login.svg',
                      width: 18, height: 18),
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    child: const Text(
                      '카카오 로그인',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: BLACK_FONT_COLOR_1C,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
