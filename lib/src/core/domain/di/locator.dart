import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/module/admin/admin_products/presentation/logic/big_image/big_image_cubit.dart';
import 'package:e_commerce/src/module/admin/admin_products/presentation/logic/colors_and_sizes/colors_and_sizes_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../../../lib.dart';
import '../../../module/admin/admin_products/admin_products.dart';
import '../../../module/admin/admin_products/domain/usecases/usecases.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // init splash
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  // FlutterNativeSplash.removeAfter(initialization);

  ///Bloc
  sl.registerFactory(() => ThemeBloc());

  sl.registerFactory(
    () => AuthBloc(
      getCurrentUser: sl(),
      //updateCurrentUser: sl(),
      signInWithEmail: sl(),
      signInWithGoogle: sl(),
      signUp: sl(),
      signOut: sl(),
    ),
  );

  sl.registerFactory(() => ProductBloc(
        getProductsByQuery: sl(),
        getNewAndSaleProducts: sl(),
        setProducts: sl(),
        getAllProducts: sl(),
        getProductDatails: sl(),
      ));

  // sl.registerFactory(() => ProductBloc(
  //       getProduct: sl(),
  //     ));

  sl.registerFactory(() => BagBloc(
        setProductToCart: sl(),
        getAllProductsFromCart: sl(),
        deleteProductFromCart: sl(),
        setNewQuantity: sl(),
        setOrder: sl(),
      ));

  sl.registerFactory(() => FavoritesBloc(
        addProductToFavorites: sl(),
        getAllFavoritesProducts: sl(),
        deleteProductFromFavorites: sl(),
      ));

  sl.registerFactory(() => RatingAndReviewsBloc(
        getAllRatingAndReviews: sl(),
        setRatingAndReviews: sl(),
        // getProductRating: sl(),
        // setProductRating: sl(),
        // getProductReviews: sl(),
        // setProductReviews: sl(),
      ));

  sl.registerFactory(() => ProfileBloc(
        getUserInfo: sl(),
        updateUserInfo: sl(),
        getAllShippingAddress: sl(),
        addShippingAddress: sl(),
        updateShippingAddress: sl(),
        selectDefaultAddress: sl(),
      ));

  sl.registerFactory(() => ShippingAddressCubit(
        addAddress: sl(),
        getAllAddresses: sl(),
        updateAddress: sl(),
        selectDefaultAddress: sl(),
      ));

  sl.registerFactory(() => PaymentMethodsCubit(
        addNewCard: sl(),
        getAllCards: sl(),
        selectDefaultCard: sl(),
      ));

  sl.registerFactory(() => OrdersCubit());

  //sl.registerFactory(() => MultipleToogleBtnCubit());

  sl.registerFactory(() => CounterCubit());
  //sl.registerFactory(() => CategoryToggleBtnCubit());
  sl.registerFactory(() => SizesToggleBtnCubit());
  sl.registerFactory(() => ColorsToggleBtnCubit());
  sl.registerFactory(() => TabBarCubit());
  sl.registerFactory(() => TabBarAdminCubit());
  sl.registerFactory(() => OrientationCubit());
  sl.registerFactory(() => SortingBtnCubit());
  //sl.registerFactory(() => SortToggleBtnCubit());

  //Bloc/Brands
  sl.registerFactory(() => BrandsBloc(
        getAllBrands: sl(),
        addBrand: sl(),
        daleteBrand: sl(),
      ));

  //Bloc/Categories
  sl.registerFactory(() => CategoriesBloc(
        getCategories: sl(),
        getAllCategories: sl(),
        addCategory: sl(),
        daleteCategory: sl(),
      ));
  sl.registerFactory(() => TypeToggleBtnCubit());
  sl.registerFactory(() => SingleToggleBtnCubit());

  // Bloc/Images
  sl.registerFactory(() => ImageCubit(
        setProductImage: sl(),
        getAllProductSmallImages: sl(),
        //getAllProductBigImages: sl(),
      ));
  sl.registerFactory(() => BigImageCubit(
        getAllProductBigImages: sl(),
      ));

  sl.registerFactory(() => ColorsAndSizesCubit());

  ///Usecases
  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  sl.registerLazySingleton(() => SignInWithEmail(sl()));
  sl.registerLazySingleton(() => SignInWithGoogle(sl()));
  sl.registerLazySingleton(() => SignUp(sl()));
  sl.registerLazySingleton(() => SignOut(sl()));
  //sl.registerLazySingleton(() => GetAllProducts(sl()));

  // sl.registerLazySingleton(
  //     () => GetAllSortedProductsByQueryWithTwoValues(sl()));
  // sl.registerLazySingleton(
  //     () => GetAllSortedProductsByQueryWithThreeValues(sl()));

  sl.registerLazySingleton(() => GetAllCategories(sl()));
  sl.registerLazySingleton(() => GetCategories(sl()));
  sl.registerLazySingleton(() => AddCategory(sl()));
  sl.registerLazySingleton(() => DaleteCategory(sl()));

  sl.registerLazySingleton(() => SetProductToCart(sl()));
  sl.registerLazySingleton(() => GetAllProductsFromCart(sl()));
  sl.registerLazySingleton(() => DeleteProductFromCart(sl()));
  sl.registerLazySingleton(() => AddProductToFavorites(sl()));
  sl.registerLazySingleton(() => GetAllFavoritesProducts(sl()));
  sl.registerLazySingleton(() => DeleteProductFromFavorites(sl()));
  //sl.registerLazySingleton(() => GetProductSizesList(sl()));
  //sl.registerLazySingleton(() => GetProductQuantity(sl()));
  sl.registerLazySingleton(() => SetNewQuantity(sl()));

  // sl.registerLazySingleton(() => GetProductsOfTheCollection(sl()));
  // sl.registerLazySingleton(() => GetProductsOfTheCategory(sl()));

  sl.registerLazySingleton(() => GetFiltiredProducts(sl()));
  sl.registerLazySingleton(() => SetOrder(sl()));
  sl.registerLazySingleton(() => GetUserInfo(sl()));
  sl.registerLazySingleton(() => UpdateUserInfo(sl()));
  sl.registerLazySingleton(() => AddShippingAddress(sl()));
  sl.registerLazySingleton(() => GetAllShippingAddress(sl()));
  sl.registerLazySingleton(() => UpdateShippingAddress(sl()));
  sl.registerLazySingleton(() => SelectDefaultShippingAddress(sl()));

  sl.registerLazySingleton(() => GetAllPaymentCards(sl()));
  sl.registerLazySingleton(() => AddNewPaymentCard(sl()));
  sl.registerLazySingleton(() => SelectDefaultPaymentCard(sl()));

  sl.registerLazySingleton(() => GetAllProducts(sl()));
  sl.registerLazySingleton(() => GetSortedProductsByQuery(sl()));

  // Usecases/Product
  sl.registerLazySingleton(() => GetProductsByQuery(sl()));
  sl.registerLazySingleton(() => GetNewAndSaleProducts(sl()));
  sl.registerLazySingleton(() => GetProductDatails(sl()));
  sl.registerLazySingleton(() => SetProduct(sl()));

  // Usecases/ProductRatingAndReviews
  sl.registerLazySingleton(() => GetProductRatingAndReviews(sl()));
  sl.registerLazySingleton(() => SetProductRatingAndReviews(sl()));
  // sl.registerLazySingleton(() => GetProductRating(sl()));
  // sl.registerLazySingleton(() => SetProductRating(sl()));
  // sl.registerLazySingleton(() => GetProductReviews(sl()));
  // sl.registerLazySingleton(() => SetProductReview(sl()));

  // Usecases/ProductImages
  sl.registerLazySingleton(() => GetAllProductSmallImages(sl()));
  sl.registerLazySingleton(() => GetAllProductBigImages(sl()));
  sl.registerLazySingleton(() => SetProductImage(sl()));

  // Usecases/brands
  sl.registerLazySingleton(() => GetAllBrands(sl()));
  sl.registerLazySingleton(() => AddBrand(sl()));
  sl.registerLazySingleton(() => DaleteBrand(sl()));

  ///Repositories
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      remoteAuth: sl(),
      localAuth: sl(),
    ),
  );

  sl.registerLazySingleton<ProductRepo>(
    () => ProductRepoImpl(
      remoteProduct: sl(),
    ),
  );

  sl.registerLazySingleton<CategoriesRepo>(
    () => CategoriesRepoImpl(
      remoteCategories: sl(),
    ),
  );

  sl.registerLazySingleton<BagRepo>(
    () => BagRepoImpl(
      localProductsFromCart: sl(),
      remoteProductsFromCart: sl(),
    ),
  );

  sl.registerLazySingleton<FavoritesRepo>(
    () => FavoritesRepoImpl(
      remoteFavorites: sl(),
    ),
  );

  // sl.registerLazySingleton<ProductRatingAndReviewsRepo>(
  //   () => ProductRatingAndReviewsRepoImpl(
  //     remoteRatingAndReviews: sl(),
  //   ),
  // );

  sl.registerLazySingleton<ShippingAddressRepo>(
    () => ShippingAddressRepoImpl(
      remoteShippingAddress: sl(),
    ),
  );

  sl.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(
      remoteProfile: sl(),
    ),
  );

  // Repo/ProductImages
  sl.registerLazySingleton<ProductImageRepo>(
    () => ProductImageRepoImpl(
      remoteProductImage: sl(),
    ),
  );

  // Repo/Brands
  sl.registerLazySingleton<BrandsRepo>(
    () => BrandsRepoImpl(
      remoteBrands: sl(),
    ),
  );

  ///datasource
  sl.registerLazySingleton<FirebaseAuthData>(
    () => FirebaseAuthDataImpl(
      firebaseAuth: sl(),
      firestore: sl(),
    ),
  );

  sl.registerLazySingleton<RemoteProduct>(
    () => RemoteProductImpl(
      firestore: sl(),
      //fakeData: sl(),
    ),
  );

  sl.registerLazySingleton<RemoteCategories>(
    () => RemoteCategoriesImpl(
      firestore: sl(),
    ),
  );

  sl.registerLazySingleton<RemoteProductsFromCart>(
    () => RemoteProductsFromCartImpl(
      firestore: sl(),
    ),
  );

  sl.registerLazySingleton<LocalProductsFromCart>(
    () => LocalProductsFromCartImpl(
      localDB: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => BagProductDB(),
  );

  sl.registerLazySingleton<RemoteFavorites>(
    () => RemoteFavoritesImpl(
      firestore: sl(),
    ),
  );

  sl.registerLazySingleton<RemoteProfile>(
    () => RemoteProfileImpl(
      firestore: sl(),
    ),
  );

  sl.registerLazySingleton<RemoteShippingAddress>(
    () => RemoteShippingAddressImpl(
      firestore: sl(),
    ),
  );

  // sl.registerLazySingleton<RemoteProductRatingAndReviews>(
  //   () => RemoteProductRatingAndReviewsImpl(
  //     firestore: sl(),
  //   ),
  // );

  sl.registerLazySingleton<FirebaseAuthWithFirestore>(
    () => FirebaseAuthImpl(
      firebaseAuth: sl(),
      firestore: sl(),
    ),
  );

  sl.registerLazySingleton<LocalAuth>(
    () => AuthSharedPreferencesImpl(authPreferences: sl()),
  );

  sl.registerLazySingleton<RemoteProductImage>(
    () => RemoteProductImageImpl(
      fbStorageCore: sl(),
    ),
  );

  // Data/Brands
  sl.registerLazySingleton<RemoteBrands>(
    () => RemoteBrandsImpl(
      firestore: sl(),
    ),
  );

  ///Core
  sl.registerLazySingleton<FirebaseAuthCore>(
    () => FirebaseAuthCoreImpl(firebaseAuth: sl()),
  );
  sl.registerLazySingleton<FirestoreCore>(
    () => FirestoreCoreImpl(firestoreDB: sl()),
  );
  sl.registerLazySingleton<FirebaseStorageCore>(
    () => FirebaseStorageCoreImpl(fbStorage: sl()),
  );
  sl.registerLazySingleton<SharedPreferencesDB>(
    () => SharedPreferencesImpl(preferencesCore: sl()),
  );

  ///Extarnal
  // Firebase
  final firebase = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  sl.registerLazySingleton(() => firebase);
  final firebaseAuthDB = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuthDB);
  final firestoreDB = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => firestoreDB);
  final fbStorage = FirebaseStorage.instance;
  sl.registerLazySingleton(() => fbStorage);

  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  /// Fake Data
  // final allFakeProducts = FakeProductData();
  // sl.registerLazySingleton(() => allFakeProducts);
}
