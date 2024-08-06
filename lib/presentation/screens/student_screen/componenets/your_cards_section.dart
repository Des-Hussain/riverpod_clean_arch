//
// import 'package:flutter/material.dart';
//
// import '../../../../common/widgets/card_details_widget.dart';
// import '../../../../common/widgets/header_widget.dart';
// import '../../../../data/models/card_details.dart';
//
// class CardsSection extends StatelessWidget {
//   final List<CardDetails> cardDetails;
//
//   const CardsSection({Key? key, required this.cardDetails}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Header(
//       title: "Your Cards",
//       suffix: Container(),
//       searchOnTap: () {  },
//       children: cardDetails
//           .map(
//             (CardDetails details) => CardDetailsWidget(cardDetails: details),
//           )
//           .toList(),
//     );
//   }
// }
