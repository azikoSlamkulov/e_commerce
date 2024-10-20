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

class CreatedBrandState extends BrandsState {
  final bool isCreated;
  final String brandName;
  const CreatedBrandState(this.isCreated, this.brandName);
  @override
  List<Object> get props => [isCreated, brandName];
}

class DeletedBrandState extends BrandsState {
  final bool isDeleted;
  final String brandName;
  const DeletedBrandState(this.isDeleted, this.brandName);
  @override
  List<Object> get props => [isDeleted, brandName];
}

class BrandsFailureState extends BrandsState {
  final String message;
  const BrandsFailureState(this.message);
  @override
  List<Object> get props => [message];
}
