import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  // GetAllOrders getAllOrders;
  // GetOrderInfo getOrderInfo;
  OrdersCubit(
      //{
      // required this.getAllOrders,
      // required this.getOrderInfo,
      //}
      )
      : super(LoadingOrdersState());

  // final List<OrderEntity> allOrders = [
  //   const OrderEntity(
  //     id: '',
  //     userID: '',
  //     userName: '',
  //     orderNumber: 123,
  //     trackingNumber: 'IW3475453455',
  //     status: 'delivered',
  //     items: [
  //       BagEntity(
  //         productID: '1',
  //         name: 'Wedding dress',
  //         color: 'White',
  //         size: 'L',
  //         pricePerUnit: 100,
  //         cardTotalPrice: 100,
  //         quantity: 1,
  //         productImgUrl:
  //             'https://i.pinimg.com/474x/83/cf/18/83cf1832e706ec7e19fe53382aa398f9.jpg',
  //       ),
  //       BagEntity(
  //         productID: '2',
  //         name: 'Wedding dress',
  //         color: 'White',
  //         size: 'L',
  //         pricePerUnit: 100,
  //         cardTotalPrice: 100,
  //         quantity: 1,
  //         productImgUrl:
  //             'https://i.pinimg.com/474x/83/cf/18/83cf1832e706ec7e19fe53382aa398f9.jpg',
  //       ),
  //       BagEntity(
  //         productID: '3',
  //         name: 'Wedding dress',
  //         color: 'White',
  //         size: 'L',
  //         pricePerUnit: 100,
  //         cardTotalPrice: 100,
  //         quantity: 1,
  //         productImgUrl:
  //             'https://i.pinimg.com/474x/83/cf/18/83cf1832e706ec7e19fe53382aa398f9.jpg',
  //       ),
  //     ],
  //     shippingAddress: 'Toktogul 45, Bishkek, Kyrgyzstan',
  //     paymentMethod: '**** **** **** 3947',
  //     deliveryMethod: 'FedEx, 3 days, 15\$',
  //     discount: '10%, Personal promo code',
  //     totalAmount: 123,
  //     createdDate: '05-12-2019',
  //   ),
  //   const OrderEntity(
  //     id: '',
  //     userID: '',
  //     userName: '',
  //     orderNumber: 456,
  //     trackingNumber: 'IW3475453455',
  //     status: 'processing',
  //     items: [
  //       BagEntity(
  //         productID: '1',
  //         name: 'Wedding dress',
  //         color: 'White',
  //         size: 'L',
  //         pricePerUnit: 100,
  //         cardTotalPrice: 100,
  //         quantity: 1,
  //         productImgUrl:
  //             'https://i.pinimg.com/474x/83/cf/18/83cf1832e706ec7e19fe53382aa398f9.jpg',
  //       ),
  //       BagEntity(
  //         productID: '2',
  //         name: 'Wedding dress',
  //         color: 'White',
  //         size: 'L',
  //         pricePerUnit: 100,
  //         cardTotalPrice: 100,
  //         quantity: 1,
  //         productImgUrl:
  //             'https://i.pinimg.com/474x/83/cf/18/83cf1832e706ec7e19fe53382aa398f9.jpg',
  //       ),
  //       BagEntity(
  //         productID: '3',
  //         name: 'Wedding dress',
  //         color: 'White',
  //         size: 'L',
  //         pricePerUnit: 100,
  //         cardTotalPrice: 100,
  //         quantity: 1,
  //         productImgUrl:
  //             'https://i.pinimg.com/474x/83/cf/18/83cf1832e706ec7e19fe53382aa398f9.jpg',
  //       ),
  //     ],
  //     shippingAddress: 'Toktogul 45, Bishkek, Kyrgyzstan',
  //     paymentMethod: '**** **** **** 3947',
  //     deliveryMethod: 'FedEx, 3 days, 15\$',
  //     discount: '10%, Personal promo code',
  //     totalAmount: 123,
  //     createdDate: '05-12-2019',
  //   ),
  // ];

  List<OrderEntity> _delivered = [];
  List<OrderEntity> _processing = [];
  List<OrderEntity> _cancelled = [];

  void getOrdersStatus(List<OrderEntity> allOrders) {
    _delivered = allOrders.where((i) => i.status == 'delivered').toList();
    _processing = allOrders.where((i) => i.status == 'processing').toList();
    _cancelled = allOrders.where((i) => i.status == 'cancelled').toList();
  }

  void getOrders(List<OrderEntity> allOrders) async {
    getOrdersStatus(allOrders);
    emit(LoadedAllOrdersState(
      delivered: _delivered,
      processing: _processing,
      cancelled: _cancelled,
    ));
  }

  // void getOrders() async {
  //   //emit(LoadingOrdersState());
  //   final allOrders = await getAllOrders.getAllOrders();
  //   allOrders.fold(
  //     (error) => emit(const FailureOrderState('')),
  //     (allOrders) {
  //       getOrdersStatus(allOrders);
  //       emit(LoadedAllOrdersState(
  //         delivered: delivered,
  //         processing: processing,
  //         cancelled: cancelled,
  //       ));
  //     },
  //   );
  // }
}
