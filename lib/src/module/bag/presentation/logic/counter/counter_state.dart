part of 'counter_cubit.dart';

class CounterState {
  final int quantity;
  final double cardTotalPrice;
  //final double totalAmount;
  const CounterState({
    required this.quantity,
    required this.cardTotalPrice,
    //required this.totalAmount,
  });
}

// abstract class CounterState extends Equatable {
//   const CounterState();

//   @override
//   List<Object> get props => [];
// }

// class CounterInitialState extends CounterState {
//   final int quantity;

//   const CounterInitialState({required this.quantity});
//   @override
//   List<Object> get props => [quantity];
// }

// class CounterLoadingState extends CounterState {}

// class CounterNewState extends CounterState {
//   final int quantity;
//   final double price;
//   final double totalAmount;

//   const CounterNewState({
//     required this.quantity,
//     required this.price,
//     required this.totalAmount,
//   });
//   @override
//   List<Object> get props => [quantity, price, totalAmount];
// }
