import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSortWidget extends StatelessWidget {
  const ProductSortWidget({
    required this.selectedSortBtnCallback,
    required this.allProducts,
    super.key,
  });

  final ValueSetter<String> selectedSortBtnCallback;
  final List<ProductEntity> allProducts;

  // List<bool> isSelected = [false, true, false, false, false];
  // String _choice = 'Newest';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortingBtnCubit, SortingState>(
      builder: (context, state) {
        return TextButton.icon(
          onPressed: () {
            AppBottomSheet.showBottomSheet(
              context: context,
              title: 'Sort by',
              content: ToggleButtons(
                isSelected: state.isSelected,
                direction: Axis.vertical,
                color: Colors.black54,
                selectedColor: Colors.white,
                fillColor: Colors.red,
                splashColor: Colors.red,
                renderBorder: false,
                constraints: BoxConstraints(
                  minHeight: 48.h,
                  minWidth: MediaQuery.of(context).size.width,
                  // minWidth: double.infinity,
                ),
                children: [
                  text('Popular'),
                  text('Newest'),
                  text('Customer review'),
                  text('Price: lowest to high'),
                  text('Price: highest to low'),
                ],
                onPressed: (int newIndex) {
                  BlocProvider.of<SortingBtnCubit>(context)
                      .getSortingChoice(newIndex, allProducts);
                  // for (int index = 0; index < isSelected.length; index++) {
                  //   if (index == newIndex) {
                  //     isSelected[index] = true;
                  //   } else {
                  //     isSelected[index] = false;
                  //   }
                  // }
                  // switch (newIndex) {
                  //   case 0:
                  //     _choice = 'Popular';
                  //     break;
                  //   case 1:
                  //     _choice = 'Newest';
                  //     break;
                  //   case 2:
                  //     _choice = 'Customer review';
                  //     break;
                  //   case 3:
                  //     _choice = 'Price: lowest to high';
                  //     break;
                  //   case 4:
                  //     _choice = 'Price: highest to low';
                  //     break;
                  // }
                  // setState(() {});
                  Navigator.pop(context);
                },
              ),
              contentPaddingLeft: 0,
              contentPaddingRight: 0,
              contentPaddingBottom: 40,
            );
          },
          icon: const Icon(
            Icons.swap_vert_outlined,
            color: Colors.black,
          ),
          label: Text(
            state.choice,
            style: AppTextStyles.black11,
          ),
        );
      },
    );
  }
}

// class ProductSortWidget extends StatefulWidget {
//   const ProductSortWidget({
//     required this.selectedSortBtnCallback,
//     super.key,
//   });

//   final ValueSetter<String> selectedSortBtnCallback;

//   @override
//   State<ProductSortWidget> createState() => _ProductSortWidgetState();
// }

// class _ProductSortWidgetState extends State<ProductSortWidget> {
//   List<bool> isSelected = [false, true, false, false, false];
//   String _choice = 'Newest';

//   @override
//   Widget build(BuildContext context) {
//     return TextButton.icon(
//       onPressed: () {
//         AppBottomSheet.showBottomSheet(
//           context: context,
//           title: 'Sort by',
//           content: ToggleButtons(
//             isSelected: isSelected,
//             direction: Axis.vertical,
//             color: Colors.black54,
//             selectedColor: Colors.white,
//             fillColor: Colors.red,
//             splashColor: Colors.red,
//             renderBorder: false,
//             constraints: BoxConstraints(
//               minHeight: 48.h,
//               minWidth: MediaQuery.of(context).size.width,
//               // minWidth: double.infinity,
//             ),
//             children: [
//               text('Popular'),
//               text('Newest'),
//               text('Customer review'),
//               text('Price: lowest to high'),
//               text('Price: highest to low'),
//             ],
//             onPressed: (int newIndex) {
//               BlocProvider.of<SortingBtnCubit>(context)
//                   .getSortingChoice(newIndex);
//               for (int index = 0; index < isSelected.length; index++) {
//                 if (index == newIndex) {
//                   isSelected[index] = true;
//                 } else {
//                   isSelected[index] = false;
//                 }
//               }
//               switch (newIndex) {
//                 case 0:
//                   _choice = 'Popular';
//                   break;
//                 case 1:
//                   _choice = 'Newest';
//                   break;
//                 case 2:
//                   _choice = 'Customer review';
//                   break;
//                 case 3:
//                   _choice = 'Price: lowest to high';
//                   break;
//                 case 4:
//                   _choice = 'Price: highest to low';
//                   break;
//               }
//               setState(() {});
//               Navigator.pop(context);
//             },
//           ),
//           contentPaddingLeft: 0,
//           contentPaddingRight: 0,
//           contentPaddingBottom: 40,
//         );
//       },
//       icon: const Icon(
//         Icons.swap_vert_outlined,
//         color: Colors.black,
//       ),
//       label: Text(
//         _choice,
//         style: AppTextStyles.black11,
//       ),
//     );
//   }
// }

text(String text) {
  return Padding(
    padding: REdgeInsets.symmetric(horizontal: 16),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(fontSize: 16.sp),
      ),
    ),
  );
}
