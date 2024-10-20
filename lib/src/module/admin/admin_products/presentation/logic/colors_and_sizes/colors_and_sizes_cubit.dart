import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../shop/domain/domain.dart';
import '../../../admin_products.dart';

part 'colors_and_sizes_state.dart';

class ColorsAndSizesCubit extends Cubit<ColorsAndSizesState> {
  ColorsAndSizesCubit() : super(ColorsAndSizesInitial());

  List<AdminProductColorEntity> colorsList = [];

  getColorsAndSizes({
    required ProductColorEntity colorsAndSizes,
    required List<String> selectedImagesList,
    required List<bool> selectedColorsList,
    required List<bool> selectedSizesList,
  }) async {
    //emit(LoadingColorsAndSizesState());
    // imageList.add(productImageUrl);
    // imageList.sort((a, b) => b.compareTo(a));
    emit(LoadedColorsAndSizesState(
      colorsAndSizesList: colorsAndSizes,
      selectedImagesList: selectedImagesList,
      selectedColorsList: selectedColorsList,
      selectedSizesList: selectedSizesList,
    ));
  }

  getColors() async {
    emit(LoadingColorsAndSizesState());
    // imageList.add(productImageUrl);
    // imageList.sort((a, b) => b.compareTo(a));
    emit(LoadedColorsState(colorsList: colorsList));
  }

  addColors({
    required AdminProductColorEntity color,
  }) async {
    emit(LoadingColorsAndSizesState());
    colorsList.add(color);

    // imageList.sort((a, b) => b.compareTo(a));
    emit(LoadedColorsState(
      colorsList: colorsList,
    ));
  }
}
