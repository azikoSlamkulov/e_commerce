import 'dart:developer';

import 'package:e_commerce/lib.dart';
import 'package:e_commerce/src/module/admin/admin_products/presentation/logic/single_toggle_btn/single_toggle_btn_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Test extends StatelessWidget {
  Test({super.key});

  final List<String> buttonList = [
    'Button 1',
    'Button 2',
    'Button 3',
    'Button 4',
    'Button 5'
  ];

  String itemName = 'Newest';
  String selectedBtn = 'UnSelect';
  final List<bool> isSelectedList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(itemName, style: TextStyle(color: Colors.black)),
          50.verticalSpace,
          // ProductSortWidget(
          //   selectedSortBtnCallback: (value) {
          //     final String asd;
          //     asd = value;
          //     log(asd);
          //   },
          // ),
          ElevatedButton(
            onPressed: () {
              itemName = '444';
              log(itemName);
            },
            child: Text('ok'),
          ),
          // 30.verticalSpace,
          // Text(
          //   selectedBtn,
          //   style: AppTextStyles.black22,
          // ),
          50.verticalSpace,
          // SingleSelectToggleButton(
          //   itemList: buttonList,
          //   selectedItemsCallback: (value) => selectedBtn = value,
          //   isGridView: true,
          //   containerHeight: 140,
          //   sizedBoxWidth: 122.h,
          // ),
          BlocProvider(
            create: (context) => SingleToggleBtnCubit(),
            child: BlocBuilder<SingleToggleBtnCubit, SingleToggleBtnState>(
              builder: (context, state) {
                if (state is SingleSelectedState) {
                  selectedBtn = state.collectionChoice;
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        selectedBtn,
                        style: AppTextStyles.black22,
                      ),
                      100.verticalSpace,
                      SingleSelectToggleBtnWithBlocWidget(
                        buttonList: buttonList,
                        state: state,
                        onPressed: () {
                          //           context.read<SingleToggleBtnCubit>().selected(
                          //   isSelectedList,
                          //   index,
                          //   buttonName,
                          // );
                        },
                        containerHeight: 140,
                        sizedBoxWidth: 122.h,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
