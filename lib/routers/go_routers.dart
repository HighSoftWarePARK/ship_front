import 'package:go_router/go_router.dart';
import 'package:sip_app/constants/path.dart';
import 'package:sip_app/modules/auth/screens/signin_screen.dart';
import 'package:sip_app/modules/auth/screens/signup_email_screen.dart';
import 'package:sip_app/modules/auth/screens/signup_name_screen.dart';
import 'package:sip_app/modules/auth/screens/signup_password_screen.dart';
import 'package:sip_app/modules/auth/screens/signup_phone_screen.dart';
import 'package:sip_app/modules/community/screens/communities_screen.dart';
import 'package:sip_app/modules/expert/screens/expert_detail_screen.dart';
import 'package:sip_app/modules/expert/screens/experts_screen.dart';
import 'package:sip_app/modules/faq/screens/faq_screen.dart';
import 'package:sip_app/modules/main/screens/home_screen.dart';
import 'package:sip_app/modules/market/screens/market_detail_screen.dart';
import 'package:sip_app/modules/market/screens/markets_screen.dart';
import 'package:sip_app/modules/community/screens/community_list_manage_screen.dart';
import 'package:sip_app/modules/matching/screens/expert_matching_detail_screen.dart';
import 'package:sip_app/modules/matching/screens/expert_matchings_screen.dart';
import 'package:sip_app/modules/matching/screens/matchings_screen.dart';
import 'package:sip_app/modules/member/screens/member_edit_nickname_screen.dart';
import 'package:sip_app/modules/member/screens/member_edit_password_screen.dart';
import 'package:sip_app/modules/my_page/screens/mypage_screen.dart';
import 'package:sip_app/modules/my_page/screens/mypage_notifications_screen.dart';
import 'package:sip_app/modules/member/screens/mypage_profile_screen.dart';
import 'package:sip_app/modules/category/screens/expert_categories_screen.dart';
import 'package:sip_app/modules/category/screens/expert_sub_categories_screen.dart';
import 'package:sip_app/modules/expert/screens/mypage_register_expert_screen.dart';
import 'package:sip_app/modules/qna/screens/qna_screen.dart';
import 'package:sip_app/modules/review/screens/mypage_reviews_screen.dart';
import 'package:sip_app/modules/service_center/screens/service_center_screen.dart';
import 'package:sip_app/modules/wishlist/screens/mypage_wishlist_screen.dart';
import 'package:sip_app/modules/auth/screens/splash_screen.dart';
import 'package:sip_app/modules/wholesaler/screens/wholesales_screen.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: PATH_SPLASH,
  // initialLocation: PATH_SIGNIN,
  routes: [
    GoRoute(
        path: '/signup',
        pageBuilder: (_, state) => NoTransitionPage(child: SignupNameScreen()),
        routes: [
          GoRoute(
              path: 'email',
              pageBuilder: (_, state) => NoTransitionPage(child: SignupEmailScreen()),
          ),
          GoRoute(
            path: 'phone',
            pageBuilder: (_, state) => NoTransitionPage(child: SignupPhoneScreen()),
          ),
          GoRoute(
            path: 'password',
            pageBuilder: (_, state) => NoTransitionPage(child: SignupPasswordScreen()),
          ),
        ]
    ),
    GoRoute(
        path: '/test',
        pageBuilder: (_, state) => NoTransitionPage(child: ExpertMatchingDetailScreen())),
    GoRoute(
        path: PATH_SPLASH,
        pageBuilder: (_, state) => NoTransitionPage(child: SplashScreen())),
    GoRoute(
        path: PATH_SIGNIN,
        pageBuilder: (_, state) => NoTransitionPage(child: SigninScreen())),
    GoRoute(
        path: PATH_HOME,
        pageBuilder: (_, state) => NoTransitionPage(child: HomeScreen()),
        routes: [
          GoRoute(
              path: 'markets',
              builder: (context, state) {
                return MarketsScreen();
              },
              routes: [
                GoRoute(
                    path: 'detail/:id',
                    name: 'marketDetail',
                    builder: (context, state) {
                      return MarketDetailScreen(
                        marketId: state.pathParameters['id'] ?? '0',
                        marketName: state.queryParameters['marketName'] ?? '',
                      );
                    }),
              ]),

        ]),
    GoRoute(
        path: PATH_EXPERTS,
        pageBuilder: (_, state) => NoTransitionPage(child: ExpertsScreen()),
        routes: [

          // GoRoute(
          //     path: 'experts/:id/matchings',
          //     name: 'expertMatchings',
          //     builder: (context, state) {
          //       return ExpertDetailScreen(
          //         id: state.pathParameters['id'] ?? '0',
          //       );
          //     }),
        ]),
    GoRoute(
        path: '/experts/detail/:id',
        name: 'expertDetail',
        builder: (context, state) {
          return ExpertDetailScreen(
            expertId: state.pathParameters['id'] ?? '0',
            expertName: state.queryParameters['name'] ?? '',
          );
        }),
    GoRoute(
        path: PATH_WHOLESALES,
        pageBuilder: (_, state) => NoTransitionPage(child: WholesalesScreen())),
    GoRoute(
        path: PATH_COMMUNITIES,
        pageBuilder: (_, state) =>
            NoTransitionPage(child: CommunitiesScreen())),
    GoRoute(
        path: PATH_MYPAGE,
        pageBuilder: (_, state) => NoTransitionPage(child: MypageScreen()),
        routes: [
          GoRoute(
              path: 'reviews',
              builder: (context, state) {
                return MypageReviewsScreen();
              }),
          GoRoute(
              path: 'matchings',
              builder: (context, state) {
                return MypageMatchingsScreen();
              }),
          GoRoute(
              path: 'services',
              builder: (context, state) {
                return ServiceCenterScreen();
              },
              routes: [
                GoRoute(
                    path: 'faqs',
                    builder: (context, state) {
                      return FaqScreen();
                    }),
                GoRoute(
                    path: 'qnas',
                    builder: (context, state) {
                      return QnaScreen();
                    }),
              ]
          ),
          GoRoute(
              path: 'expert',
              builder: (context, state) {
                return MypageRegisterExpertScreen();
              },
              //ExpertCategoriesScreen
              routes: [
                GoRoute(
                    path: 'categories',
                    builder: (context, state) {
                      return ExpertCategoriesScreen();
                    },
                    //ExpertCategoriesScreen
                    routes: [
                      GoRoute(
                          path: 'sub',
                          builder: (context, state) {
                            return ExpertSubCategoriesScreen();
                          }),
                    ]),
              ]),
          GoRoute(
            path: 'profile',
            builder: (context, state) {
              return MypageProfileScreen();
            },
            routes: [
              GoRoute(
                  path: 'nickname',
                  name: 'editNickname',
                  builder: (context, state) {
                    return MemberEditNicknameScreen(
                      currentNickname: state.queryParameters['nickname'] ?? '',
                    );
                  }),
              GoRoute(
                  path: 'password',
                  name: 'editPassword',
                  builder: (context, state) {
                    return MemberEditPasswordScreen();
                  }),
            ]
          ),
          GoRoute(
              path: 'communities',
              builder: (context, state) {
                return CommunitylistManageScreen();
              }),
          GoRoute(
              path: 'notifications',
              builder: (context, state) {
                return MypageNotificationsScreen();
              }),
          GoRoute(
              path: 'wishlist',
              builder: (context, state) {
                return MypageWishlistScreen();
              }),
        ]),
  ],
);
