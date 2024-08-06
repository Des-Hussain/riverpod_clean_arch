// import 'package:flutter/cupertino.dart';
// import 'package:intl/intl.dart';
//
// class CustomLineGraphWidget extends StatefulWidget {
//   CustomLineGraphWidget({Key? key,required this.measurementList}) : super(key: key);
//   List<Measurements> measurementList;
//
//
//   @override
//   State<CustomLineGraphWidget> createState() => _CustomLineGraphWidgetState();
// }
//
// class _CustomLineGraphWidgetState extends State<CustomLineGraphWidget> {
//   late TooltipBehavior _tooltipBehavior;
//
//   void initState() {
//     _tooltipBehavior = TooltipBehavior(enable: true);
//
//     super.initState();
//
//   }
//   final customGradient = LinearGradient(
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//     colors: [
//       AppColors.primaryColor,
//       AppColors.transparent,
//     ],
//   );
//   @override
//   Widget build(BuildContext context) {
//     return SfCartesianChart(
//
//       primaryXAxis: CategoryAxis(
//         majorGridLines: MajorGridLines(width: 0), // Hide major vertical grid lines
//         minorGridLines: MinorGridLines(width: 0), // Hide minor vertical grid lines
//       ),
//       tooltipBehavior: _tooltipBehavior,
//       series: <ChartSeries<Measurements, String>>[
//
//         SplineAreaSeries<Measurements, String>(
//           enableTooltip: true,
//           markerSettings: MarkerSettings(
//             isVisible: true,
//             borderColor: AppColors.purple,
//           ),
//           color: AppColors.purple,
//           dataSource:widget.measurementList,
//           xValueMapper: (Measurements sales, _) =>
//               DateFormat(DateFormat.ABBR_MONTH_DAY)
//                   .format(sales.createdAt)
//                   .toString(),
//           yValueMapper: (Measurements sales, _) => sales.neck,
//           dataLabelSettings: DataLabelSettings(isVisible: true),
//           gradient: customGradient,
//         ),
//       ],
//     );
//   }
// }
