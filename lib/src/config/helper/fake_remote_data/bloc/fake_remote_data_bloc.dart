// import 'package:e_commerce/lib.dart';

// part 'fake_remote_data_event.dart';
// part 'fake_remote_data_state.dart';

// class FakeRemoteDataBloc
//     extends Bloc<FakeRemoteDataEvent, FakeRemoteDataState> {
//   FakeRemoteDataBloc() : super(LoadingFakeDataState()) {
//     //on<GetFakeDataEvent>(_getFakeData);
//     on<GetFakeDataListEvent>(_getAllFakeData);

//     // void _getFakeData(
//     //     GetFakeDataEvent event, Emitter<FakeRemoteDataState> emit) async {
//     //   emit(LoadingFakeDataState());
//     //   final product = await getProduct.call(
//     //     GetProductDatailsParams(
//     //       productID: event.productID!,
//     //     ),
//     //   );
//     //   product.fold(
//     //     (error) => emit(const FakeDataFailureState('')),
//     //     (product) => emit(LoadedFakeDataState(product)),
//     //   );
//     // }

//     void _getAllFakeData(
//         GetFakeDataListEvent event, Emitter<FakeRemoteDataState> emit) async {
//       emit(LoadingFakeDataState());
//       final allProducts = FakeProductData().allFakeProducts;
//       emit(LoadedAllFakeDataState(allProducts));
//     }
//   }
// }
