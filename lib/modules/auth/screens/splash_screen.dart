import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sip_app/commons/auth/auth_service.dart';
import 'package:sip_app/constants/path.dart';
import 'package:sip_app/modules/auth/providers/auth_provider.dart';
import 'package:sip_app/utils/jwt.dart';

class SplashScreen extends ConsumerStatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  void initState() {
    super.initState();

    ref.read(authProvider.notifier).checkTokenSplash(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: SizedBox(width: 50, height: 50, child: CircularProgressIndicator(),));
  }
}
