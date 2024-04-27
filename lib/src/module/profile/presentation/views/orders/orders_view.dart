import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileOrdersView extends StatelessWidget {
  const MobileOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrdersCubit>(
      create: (context) => sl<OrdersCubit>()..getOrders(),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state is LoadingOrdersState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedAllOrdersState) {
            //getOrdersStatus(state);
            return NestedOrdersView(
              //allOrders: state.allOrders,
              delivered: state.delivered,
              processing: state.processing,
              cancelled: state.cancelled,
            );
          } else if (state is FailureOrderState) {
            //return MyErrorWidget('${state.exception}');
            return Text('');
          } else {
            //return const SomeError();,
            return Text('');
          }
        },
      ),
    );
  }
}

class NestedOrdersView extends StatelessWidget {
  NestedOrdersView({
    required this.delivered,
    required this.processing,
    required this.cancelled,
    super.key,
  });

  final List<OrderEntity> delivered;
  final List<OrderEntity> processing;
  final List<OrderEntity> cancelled;

  final _items = ['Delivered', 'Processing', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
              TabBar(
                padding: REdgeInsets.symmetric(vertical: 21),
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), // Creates border
                    color: Colors.black),
                unselectedLabelStyle: TextStyle(fontSize: 16.sp),
                unselectedLabelColor: Colors.black,
                tabs: _items.map((e) => Tab(text: e, height: 35)).toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    OrdersListView(allOrders: delivered),
                    OrdersListView(allOrders: processing),
                    OrdersListView(allOrders: cancelled),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
