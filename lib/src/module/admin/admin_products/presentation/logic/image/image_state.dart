part of 'image_cubit.dart';

abstract class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

class ImageInitial extends ImageState {}

class LoadingState extends ImageState {}

class ClearedImagesState extends ImageState {}

class LoadedFileState extends ImageState {
  final XFile? image;

  const LoadedFileState(this.image);
  @override
  List<Object> get props => [image!];
}

class LoadedImageUrlState extends ImageState {
  final String imageUrl;
  final List<String> imageList;

  const LoadedImageUrlState(this.imageUrl, this.imageList);
  @override
  List<Object> get props => [imageUrl, imageList];
}

class LoadedSelectedSmallImageState extends ImageState {
  final ProductSmallImageEntity selectedSmallImage;

  const LoadedSelectedSmallImageState(this.selectedSmallImage);
  @override
  List<Object> get props => [selectedSmallImage];
}

class LoadedAllSmallImagesUrlState extends ImageState {
  final List<ProductSmallImageEntity> imageList;

  const LoadedAllSmallImagesUrlState(this.imageList);
  @override
  List<Object> get props => [imageList];
}

// class LoadedAllBigImagesUrlState extends ImageState {
//   final List<String> imageList;

//   const LoadedAllBigImagesUrlState(this.imageList);
//   @override
//   List<Object> get props => [imageList];
// }

class ImageFailureState extends ImageState {
  final String message;
  const ImageFailureState(this.message);
  @override
  List<Object> get props => [message];
}
