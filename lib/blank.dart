// import 'package:flutter/material.dart';
// import 'package:main_menu_page/http_helper.dart';

// /* Testing ra na page */
// class BlankTesting extends StatefulWidget {
//   const BlankTesting({Key? key}) : super(key: key);

//   @override
//   State<BlankTesting> createState() => _BlankTestingState();
// }

// class _BlankTestingState extends State<BlankTesting> {
//   final stateManager = HomePageManager();
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(height: 50),
//         Center(
//           child: Wrap(
//             spacing: 50,
//             alignment: WrapAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: stateManager.getItems,
//                 child: const Text('GET Items'),
//               ),
//               ElevatedButton(
//                 onPressed: stateManager.getBorrowedItems,
//                 child: const Text('GET Borrowed Items'),
//               ),
//               // ElevatedButton(
//               //   onPressed: stateManager.makePostRequest,
//               //   child: const Text('POST'),
//               // ),
//               ElevatedButton(
//                 onPressed: stateManager.deleteItem,
//                 child: const Text('DELETE Item #5'),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 20),
//         ValueListenableBuilder<RequestState>(
//           valueListenable: stateManager.resultNotifier,
//           builder: (context, requestState, child) {
//             if (requestState is RequestLoadInProgress) {
//               return const CircularProgressIndicator();
//             } else if (requestState is RequestLoadSuccess) {
//               return Expanded(
//                   child: SingleChildScrollView(child: Text(requestState.body)));
//             } else {
//               return Container();
//             }
//           },
//         ),
//       ],
//     );
//   }
// }
