import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../lib.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // init splash
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  // FlutterNativeSplash.removeAfter(initialization);

  ///Bloc
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
      ));

  // sl.registerFactory(() => ProductBloc(
  //       getProduct: sl(),
  //     ));

  sl.registerFactory(() => CategoriesBloc(
        getCategories: sl(),
        getAllCategories: sl(),
        addCategory: sl(),
        daleteCategory: sl(),
      ));

  sl.registerFactory(() => BrandsBloc(
        getAllBrands: sl(),
      ));

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

  sl.registerFactory(() => ReviewsBloc(
        getAllReviews: sl(),
        setReview: sl(),
      ));

  sl.registerFactory(() => ShippingAddressCubit(
        addAddress: sl(),
        getAllShippingAddress: sl(),
      ));

  sl.registerFactory(() => OrdersCubit());

  //sl.registerFactory(() => MultipleToogleBtnCubit());
  sl.registerFactory(() => SingleToggleBtnCubit());

  sl.registerFactory(() => CounterCubit());
  //sl.registerFactory(() => CategoryToggleBtnCubit());
  //sl.registerFactory(() => SizesToggleBtnCubit());
  //sl.registerFactory(() => ColorsToggleBtnCubit());
  sl.registerFactory(() => TabBarCubit());
  sl.registerFactory(() => TabBarAdminCubit());
  sl.registerFactory(() => OrientationCubit());
  //sl.registerFactory(() => SortToggleBtnCubit());
  //sl.registerFactory(() => SingleToggleBtnCubit());
  //sl.registerFactory(() => TypeToggleBtnCubit());

  ///Usecases
  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  sl.registerLazySingleton(() => SignInWithEmail(sl()));
  sl.registerLazySingleton(() => SignInWithGoogle(sl()));
  sl.registerLazySingleton(() => SignUp(sl()));
  sl.registerLazySingleton(() => SignOut(sl()));
  //sl.registerLazySingleton(() => GetAllProducts(sl()));
  sl.registerLazySingleton(() => GetProductsByQuery(sl()));
  // sl.registerLazySingleton(
  //     () => GetAllSortedProductsByQueryWithTwoValues(sl()));
  // sl.registerLazySingleton(
  //     () => GetAllSortedProductsByQueryWithThreeValues(sl()));
  //sl.registerLazySingleton(() => GetProductDatails(sl()));
  sl.registerLazySingleton(() => GetAllCategories(sl()));
  sl.registerLazySingleton(() => GetCategories(sl()));
  sl.registerLazySingleton(() => AddCategory(sl()));
  sl.registerLazySingleton(() => DaleteCategory(sl()));
  sl.registerLazySingleton(() => GetAllBrands(sl()));
  sl.registerLazySingleton(() => SetProductToCart(sl()));
  sl.registerLazySingleton(() => GetAllProductsFromCart(sl()));
  sl.registerLazySingleton(() => DeleteProductFromCart(sl()));
  sl.registerLazySingleton(() => AddProductToFavorites(sl()));
  sl.registerLazySingleton(() => GetAllFavoritesProducts(sl()));
  sl.registerLazySingleton(() => DeleteProductFromFavorites(sl()));
  //sl.registerLazySingleton(() => GetProductSizesList(sl()));
  //sl.registerLazySingleton(() => GetProductQuantity(sl()));
  sl.registerLazySingleton(() => SetNewQuantity(sl()));
  sl.registerLazySingleton(() => GetAllReviews(sl()));
  sl.registerLazySingleton(() => SetReview(sl()));
  // sl.registerLazySingleton(() => GetProductsOfTheCollection(sl()));
  // sl.registerLazySingleton(() => GetProductsOfTheCategory(sl()));
  sl.registerLazySingleton(() => GetNewAndSaleProducts(sl()));
  sl.registerLazySingleton(() => GetFiltiredProducts(sl()));
  sl.registerLazySingleton(() => SetOrder(sl()));
  sl.registerLazySingleton(() => AddShippingAddress(sl()));
  sl.registerLazySingleton(() => GetAllShippingAddress(sl()));
  sl.registerLazySingleton(() => SetProduct(sl()));
  sl.registerLazySingleton(() => GetAllProducts(sl()));
  sl.registerLazySingleton(() => GetSortedProductsByQuery(sl()));

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

  sl.registerLazySingleton<BrandsRepo>(
    () => BrandsRepoImpl(
      remoteBrands: sl(),
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

  sl.registerLazySingleton<ReviewsRepo>(
    () => ReviewsRepoImpl(
      remoteReviews: sl(),
    ),
  );

  sl.registerLazySingleton<ShippingAddressRepo>(
    () => ShippingAddressRepoImpl(
      remoteShippingAddress: sl(),
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

  sl.registerLazySingleton<RemoteBrands>(
    () => RemoteBrandsImpl(
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

  sl.registerLazySingleton<RemoteShippingAddress>(
    () => RemoteShippingAddressImpl(
      firestore: sl(),
    ),
  );

  sl.registerLazySingleton<RemoteReviews>(
    () => RemoteReviewsImpl(
      firestore: sl(),
    ),
  );

  sl.registerLazySingleton<FirebaseAuthWithFirestore>(
    () => FirebaseAuthImpl(
      firebaseAuth: sl(),
      firestore: sl(),
    ),
  );

  sl.registerLazySingleton<LocalAuth>(
    () => AuthSharedPreferencesImpl(authPreferences: sl()),
  );

  ///Core
  sl.registerLazySingleton<FirebaseAuthCore>(
    () => FirebaseAuthCoreImpl(firebaseAuth: sl()),
  );
  sl.registerLazySingleton<FirestoreCore>(
    () => FirestoreCoreImpl(firestoreDB: sl()),
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

  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  /// Fake Data
  // final allFakeProducts = FakeProductData();
  // sl.registerLazySingleton(() => allFakeProducts);
}
