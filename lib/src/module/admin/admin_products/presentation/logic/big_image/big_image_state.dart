part of 'big_image_cubit.dart';

sealed class BigImageState extends Equatable {
  const BigImageState();

  @override
  List<Object> get props => [];
}

final class BigImageInitial extends BigImageState {}

class LoadingBigImageState extends BigImageState {}

class LoadedAllBigImagesUrlState extends BigImageState {
  final List<String> bigImagesList;

  const LoadedAllBigImagesUrlState(this.bigImagesList);
  @override
  List<Object> get props => [bigImagesList];
}

class LoadedSelectedBigImagesUrlState extends BigImageState {
  final List<String> selctedBigImagesList;

  const LoadedSelectedBigImagesUrlState(this.selctedBigImagesList);
  @override
  List<Object> get props => [selctedBigImagesList];
}

class BigImageFailureState extends BigImageState {
  final String message;
  const BigImageFailureState(this.message);
  @override
  List<Object> get props => [message];
}
