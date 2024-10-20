import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bag.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit()
      : super(const CounterState(
          quantity: 1,
          cardTotalPrice: 0,
          //totalAmount: 0,
        ));

  //void increment() => emit(CounterState(quantity: state.quantity + 1));

  //double _totalAmount = 0;
  int _quantity = 1;
  double _pricePerUnit = 0;
  double _totalCardPrice = 0;

  // void getTotalAmount(List<BagEntity> allProducts) {
  //   for (BagEntity e in allProducts) {
  //     _totalAmount = _totalAmount + e.pricePerUnit!;
  //   }
  //   emit(CounterState(
  //     quantity: _quantity,
  //     price: _price,
  //     totalAmount: _totalAmount,
  //   ));
  // }

  void getPrise(double pricePerUnit, int newQuantity) {
    _pricePerUnit = pricePerUnit;
    _quantity = newQuantity;
    emit(CounterState(
      quantity: _quantity,
      cardTotalPrice: _pricePerUnit,
    ));
  }

  void increment() {
    //_quantity = newQuantity;
    _quantity++;
    _totalCardPrice = _pricePerUnit * _quantity;
    emit(CounterState(
      quantity: _quantity,
      cardTotalPrice: _totalCardPrice,
    ));
    //emit(CounterState(quantity: state.quantity + 1));
  }

  void decrement() {
    if (state.quantity > 1) {
      //_quantity = newQuantity;
      _quantity--;
      _totalCardPrice = _pricePerUnit * _quantity;
      emit(CounterState(
        quantity: _quantity,
        cardTotalPrice: _totalCardPrice,
      ));
      //emit(CounterState(quantity: state.quantity - 1));
    }
  }
}

// class CounterCubit extends Cubit<CounterState> {
//   CounterCubit() : super(const CounterInitialState(quantity: 1));

//   double _totalAmount = 0;
//   int _quantity = 1;
//   double _pricePerUnit = 0;
//   double _price = 0;

//   void getTotalAmount(List<BagEntity> allProducts) {
//     for (BagEntity e in allProducts) {
//       _totalAmount = _totalAmount + e.pricePerUnit!;
//     }
//     emit(CounterNewState(
//         quantity: _quantity, price: _price, totalAmount: _totalAmount));
//   }

//   void getPrise(double pricePerUnit) {
//     _pricePerUnit = pricePerUnit;
//     emit(CounterNewState(
//         quantity: _quantity, price: _price, totalAmount: _totalAmount));
//   }

//   void increment() {
//     emit(CounterLoadingState());
//     _quantity = _quantity + 1;
//     _price = _pricePerUnit * _quantity;
//     _totalAmount = _totalAmount + _pricePerUnit;
//     emit(CounterNewState(
//         quantity: _quantity, price: _price, totalAmount: _totalAmount));
//   }

//   void decrement() {
//     emit(CounterLoadingState());
//     if (_quantity > 1) {
//       _quantity--;
//       _price = _pricePerUnit * _quantity;
//       _totalAmount = _totalAmount - _pricePerUnit;
//       emit(CounterNewState(
//           quantity: _quantity, price: _price, totalAmount: _totalAmount));
//     }
//   }
// }
