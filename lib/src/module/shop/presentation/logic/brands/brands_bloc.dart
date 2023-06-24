import 'package:e_commerce/lib.dart';

part 'brands_event.dart';
part 'brands_state.dart';

class BrandsBloc extends Bloc<BrandsEvent, BrandsState> {
  final GetAllBrands getAllBrands;

  BrandsBloc({
    required this.getAllBrands,
  }) : super(BrandInitialState()) {
    on<GetAllBrandsEvent>(_getAllBrand);
    on<TypedBrandsEvent>(_typedBrand);
  }

  void _getAllBrand(GetAllBrandsEvent event, Emitter<BrandsState> emit) async {
    emit(BrandLoadingState());
    final allBrand = await getAllBrands.getAllBrands();
    allBrand.fold(
      (error) => emit(const BrandsFailureState('')),
      (_allBrand) {
        emit(LoadedAllBrandsState(_allBrand));
      },
    );
  }

  void _typedBrand(TypedBrandsEvent event, Emitter<BrandsState> emit) async {
    emit(BrandLoadingState());
    emit(TypedBrandState(event.typedBrandName));
  }
}
