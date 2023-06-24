import 'package:e_commerce/lib.dart';

class MobileOrdersView extends StatelessWidget {
  const MobileOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: '',
        bgColor: AppColors.bgColorMain,
        showSearchBtn: true,
      ),
      body: Padding(
        padding: REdgeInsets.only(left: 16, right: 16, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('My Orders', style: AppTextStyles.black34Bold),
            //24.verticalSpace,
            Padding(
              padding: REdgeInsets.symmetric(vertical: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ordersToggleBtn(text: 'Delivered', isActivity: true),
                  ordersToggleBtn(text: 'Processing', isActivity: false),
                  ordersToggleBtn(text: 'Cancelled', isActivity: false),
                ],
              ),
            ),
            // Container(
            //   color: Colors.white,
            //   height: 70.h,
            //   child: Padding(
            //     padding: REdgeInsets.symmetric(horizontal: 16),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         ordersToggleBtn(text: 'Delivered', isActivity: true),
            //         ordersToggleBtn(text: 'Processing', isActivity: false),
            //         ordersToggleBtn(text: 'Cancelled', isActivity: false),
            //       ],
            //     ),
            //   ),
            // ),
            Expanded(
              child: ListView.builder(
                //padding: REdgeInsets.symmetric(vertical: 37),
                itemCount: 6,
                itemExtent: 206.h,
                itemBuilder: (context, index) {
                  //final product = allProducts[index];
                  return Card(
                    margin: REdgeInsets.only(bottom: 20),
                    color: Colors.white,
                    child: Padding(
                      padding: REdgeInsets.all(19.0),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Order №1947034',
                              style: AppTextStyles.black16,
                            ),
                            Text(
                              '05-12-2019',
                              style: AppTextStyles.grey14,
                            ),
                          ],
                        ),
                        15.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Tracking number:  ',
                              style: AppTextStyles.grey14,
                            ),
                            Text(
                              'IW3475453455',
                              style: AppTextStyles.black14,
                            ),
                          ],
                        ),
                        15.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Quantity:  ',
                                  style: AppTextStyles.grey14,
                                ),
                                Text(
                                  '3',
                                  style: AppTextStyles.black14,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Total Amount: ',
                                  style: AppTextStyles.grey14,
                                ),
                                Text(
                                  '112\$',
                                  style: AppTextStyles.black14Bold,
                                ),
                              ],
                            ),
                          ],
                        ),
                        15.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ordersBtn(context: context, text: 'Details'),
                            Text(
                              'Delivered',
                              style: AppTextStyles.green14,
                            ),
                          ],
                        ),
                      ]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ordersToggleBtn({
    required String text,
    required bool isActivity,
  }) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: REdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide.none,
        ),
        backgroundColor: isActivity ? Colors.black : null,
      ),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          color: isActivity ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  ordersBtn({
    required BuildContext context,
    required String text,
  }) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: REdgeInsets.symmetric(
          horizontal: 20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        side: const BorderSide(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      onPressed: () {
        context.goNamed(
          AppPage.orderDetails.toName,
        );
      },
      child: Text(
        text,
        style: AppTextStyles.black14,
      ),
    );
  }
}



// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bgColorMain,
//       // appBar: CustomAppBar(
//       //   title: '',
//       //   bgColor: AppColors.bgColorMain,
//       //   showSearchBtn: true,
//       // ),
//       body: CustomScrollView(
//         slivers: <Widget>[
//           //2
//           SliverAppBar(
//             expandedHeight: 250.0,
//             pinned: true,
//             // shape: ,
//             // floating: ,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('My Orders', style: AppTextStyles.black34Bold),
//                   24.verticalSpace,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       ordersToggleBtn(text: 'Delivered', isActivity: true),
//                       ordersToggleBtn(text: 'Processing', isActivity: false),
//                       ordersToggleBtn(text: 'Cancelled', isActivity: false),
//                     ],
//                   ),
//                 ],
//               ),
//               // background: Column(
//               //   crossAxisAlignment: CrossAxisAlignment.start,
//               //   children: [
//               //     Text('My Orders', style: AppTextStyles.black34Bold),
//               //     24.verticalSpace,
//               //     // Row(
//               //     //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//               //     //   children: [
//               //     //     ordersToggleBtn(text: 'Delivered', isActivity: true),
//               //     //     ordersToggleBtn(text: 'Processing', isActivity: false),
//               //     //     ordersToggleBtn(text: 'Cancelled', isActivity: false),
//               //     //   ],
//               //     // ),
//               //   ],
//               // ),
//             ),
//           ),
//           //3
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (_, int index) {
//                 return ListTile(
//                   leading: Container(
//                       padding: EdgeInsets.all(8),
//                       width: 100,
//                       child: Placeholder()),
//                   title: Text('Place ${index + 1}', textScaleFactor: 2),
//                 );
//               },
//               childCount: 20,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
