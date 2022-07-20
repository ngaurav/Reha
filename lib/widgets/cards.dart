// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class Cards extends StatelessWidget {
//   final String heading;
//   final String subheading;
//   final Image image;
//   final Color color;
//   const Cards({
//     Key? key,
//     required this.heading,
//     required this.subheading,
//     required this.image,
//     required this.color,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 40,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Row(children: [
//           Column(
//             children: [
//               //Session heading
//               Text(heading),
//               // Completed perfomed
//               Container(
//                 child: Text(subheading),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(
//                     15,
//                   ),
//                   color: color,
//                 ),
//               ),
//             ],
//           ),
//         ]),
//       ),
//     );
//   }
// }
