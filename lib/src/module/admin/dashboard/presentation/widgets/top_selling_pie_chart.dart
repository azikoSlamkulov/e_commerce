// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// import '../../../orders/domain/entities/order_info_entity.dart';

// class TopSellingPieChart extends StatelessWidget {
//   const TopSellingPieChart({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<OrderInfoEntity> topsellingChart = [
//       const OrderInfoEntity(
//         title: "nike 584",
//         quantity: 50,
//         color: Colors.purple,
//         percentage: 20,
//       ),
//       const OrderInfoEntity(
//         title: "adidas 584",
//         quantity: 30,
//         color: Colors.deepOrange,
//         percentage: 20,
//       ),
//       const OrderInfoEntity(
//         title: "puma asdasd ",
//         quantity: 10,
//         color: Colors.amber,
//         percentage: 20,
//       ),
//       OrderInfoEntity(
//         title: "rebook running shoes",
//         quantity: 7,
//         color: Colors.blue.shade900,
//         percentage: 20,
//       ),
//       const OrderInfoEntity(
//         title: "adias x 19  football shoes",
//         quantity: 3,
//         color: Colors.redAccent,
//         percentage: 20,
//       ),
//     ];
//     return Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           //color: secondaryColor,
//         ),
//         child: SfCircularChart(
//             title: ChartTitle(text: 'Top 5 Selling Products'),
//             legend: const Legend(isVisible: true),
//             series: <CircularSeries>[
//               // Renders radial bar chart
//               PieSeries<OrderInfoEntity, String>(
//                   explode: true,
//                   explodeIndex: 1,
//                   radius: '55%',
//                   dataLabelSettings: const DataLabelSettings(
//                       isVisible: true,
//                       labelIntersectAction: LabelIntersectAction.shift,
//                       overflowMode: OverflowMode.shift,
//                       showZeroValue: true,
//                       labelPosition: ChartDataLabelPosition.inside,
//                       connectorLineSettings:
//                           ConnectorLineSettings(type: ConnectorType.curve)),
//                   dataSource: topsellingChart,
//                   pointColorMapper: (OrderInfoEntity data, _) => data.color,
//                   dataLabelMapper: (OrderInfoEntity data, _) =>
//                       data.percentage.toString(),
//                   xValueMapper: (OrderInfoEntity data, _) => data.title,
//                   yValueMapper: (OrderInfoEntity data, _) => data.percentage)
//             ]));
//   }
// }
