part of 'brands_bloc.dart';

abstract class BrandsState extends Equatable {
  const BrandsState();

  @override
  List<Object> get props => [];
}

class BrandInitialState extends BrandsState {}

class BrandLoadingState extends BrandsState {}

class LoadedAllBrandsState extends BrandsState {
  final List<BrandEntity> allBrands;
  const LoadedAllBrandsState(this.allBrands);
  @override
  List<Object> get props => [allBrands];
}

class TypedBrandState extends BrandsState {
  final String typedBrandName;
  const TypedBrandState(this.typedBrandName);
  @override
  List<Object> get props => [typedBrandName];
}

class BrandsFailureState extends BrandsState {
  final String message;
  const BrandsFailureState(this.message);
  @override
  List<Object> get props => [message];
}
