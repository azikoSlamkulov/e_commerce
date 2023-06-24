part of 'brands_bloc.dart';

abstract class BrandsEvent extends Equatable {
  const BrandsEvent();

  @override
  List<Object> get props => [];
}

class GetAllBrandsEvent extends BrandsEvent {}

class TypedBrandsEvent extends BrandsEvent {
  final String typedBrandName;

  const TypedBrandsEvent(
    this.typedBrandName,
  );
}
