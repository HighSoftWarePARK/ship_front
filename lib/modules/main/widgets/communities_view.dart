// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sip_app/constants/colors.dart';
// import 'package:sip_app/constants/path.dart';
// import 'package:sip_app/modules/community/models/community_model.dart';
//
// class CommunitiesView extends StatelessWidget {
//   final List<CommunityModel> communities;
//
//   const CommunitiesView({required this.communities, Key? key})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//           color: Colors.white),
//       child: Column(children: [
//         Container(
//             child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('커뮤니티',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
//             TextButton(
//                 onPressed: () {},
//                 child: TextButton(
//                   onPressed: () {
//                     context.go(PATH_COMMUNITIES);
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text('전체보기',
//                           style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               color: NAVIGATION_TEXT_COLOR)),
//                       SizedBox(width: 6),
//                       Container(
//                         width: 5,
//                         height: 10,
//                         margin: EdgeInsets.only(top: 1),
//                         child: SvgPicture.asset(
//                             'assets/icons/icon_arrow_right_blue.svg',
//                             fit: BoxFit.cover),
//                       )
//                     ],
//                   ),
//                 ))
//           ],
//         )),
//         SizedBox(height: 20),
//         ...List.generate(
//             communities.length,
//             (i) => CommunityItem(
//                 community: communities[i], isLast: communities.length == i + 1))
//       ]),
//     );
//   }
// }
//
// class CommunityItem extends StatelessWidget {
//   final CommunityModel community;
//   final bool isLast;
//
//   const CommunityItem({required this.community, required this.isLast, Key? key})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(community.communityCategory.name,
//             style: TextStyle(
//                 color: COMMUNITY_CATEGORY_COLOR,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 14)),
//         SizedBox(height: 8),
//         Text(community.title,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//                 color: BLACK_COLOR_FONT,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500)),
//         SizedBox(height: 8),
//         Text(community.content,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//                 color: GRAY_COLOR_FONT,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400)),
//         SizedBox(height: 18),
//         Row(
//           children: [
//             Container(
//                 width: 16,
//                 height: 16,
//                 child: SvgPicture.asset('assets/icons/icon_like.svg',
//                     fit: BoxFit.cover)),
//             SizedBox(width: 6),
//             Text(community.goods != null ? community.goods.toString() : '0',
//                 style: TextStyle(
//                     color: GRAY_COLOR_FONT,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500)),
//             SizedBox(width: 16),
//             Container(
//                 width: 16,
//                 height: 16,
//                 child: SvgPicture.asset('assets/icons/icon_comment.svg',
//                     fit: BoxFit.cover)),
//             SizedBox(width: 6),
//             Text(
//                 community.commnets_count != null
//                     ? community.commnets_count.toString()
//                     : '0',
//                 style: TextStyle(
//                     color: GRAY_COLOR_FONT,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500)),
//           ],
//         ),
//         SizedBox(height: 18),
//         isLast
//             ? SizedBox()
//             : Column(
//                 children: [
//                   Container(height: 1, color: INPUT_BACKGROUND_GRAY_COLOR),
//                   SizedBox(height: 20),
//                 ],
//               ),
//       ],
//     );
//   }
// }
