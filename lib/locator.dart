import 'lib.dart';

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

  sl.registerFactory(() => ProducBloc(
        //getProductDatails: sl(),
        getAllProducts: sl(),
        getAllSortedProducts: sl(),
        getAllSortedProductsWithTwoValues: sl(),
        getAllSortedProductsWithThreeValues: sl(),
      ));

  // sl.registerFactory(() => ProductBloc(
  //       getProduct: sl(),
  //     ));

  sl.registerFactory(() => CategoriesBloc(
        getCategories: sl(),
      ));

  sl.registerFactory(() => BrandsBloc(
        getAllBrands: sl(),
      ));

  sl.registerFactory(() => BagBloc(
        setProductToCart: sl(),
        getAllProductsFromCart: sl(),
        deleteProductFromCart: sl(),
      ));

  sl.registerFactory(() => FavoritesBloc(
        addProductToFavorites: sl(),
        getAllFavoritesProducts: sl(),
        deleteProductFromFavorites: sl(),
      ));

  sl.registerFactory(() => CounterCubit());
  sl.registerFactory(() => CategoryToggleBtnCubit());
  sl.registerFactory(() => SizesToggleBtnCubit());
  sl.registerFactory(() => ColorsToggleBtnCubit());
  sl.registerFactory(() => TabBarCubit());
  sl.registerFactory(() => OrientationCubit());
  sl.registerFactory(() => SortToggleBtnCubit());

  ///Usecases
  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  sl.registerLazySingleton(() => SignInWithEmail(sl()));
  sl.registerLazySingleton(() => SignInWithGoogle(sl()));
  sl.registerLazySingleton(() => SignUp(sl()));
  sl.registerLazySingleton(() => SignOut(sl()));
  sl.registerLazySingleton(() => GetAllProducts(sl()));
  sl.registerLazySingleton(() => GetAllSortedProductsByQuery(sl()));
  sl.registerLazySingleton(
      () => GetAllSortedProductsByQueryWithTwoValues(sl()));
  sl.registerLazySingleton(
      () => GetAllSortedProductsByQueryWithThreeValues(sl()));
  sl.registerLazySingleton(() => GetProductDatails(sl()));
  sl.registerLazySingleton(() => GetAllCategories(sl()));
  sl.registerLazySingleton(() => GetAllBrands(sl()));
  sl.registerLazySingleton(() => SetProductToCart(sl()));
  sl.registerLazySingleton(() => GetAllProductsFromCart(sl()));
  sl.registerLazySingleton(() => DeleteProductFromCart(sl()));
  sl.registerLazySingleton(() => AddProductToFavorites(sl()));
  sl.registerLazySingleton(() => GetAllFavoritesProducts(sl()));
  sl.registerLazySingleton(() => DeleteProductFromFavorites(sl()));
  sl.registerLazySingleton(() => GetProductSizesList(sl()));
  sl.registerLazySingleton(() => GetProductQuantity(sl()));

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
      remoteProductsFromCart: sl(),
    ),
  );

  sl.registerLazySingleton<FavoritesRepo>(
    () => FavoritesRepoImpl(
      remoteFavorites: sl(),
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

  sl.registerLazySingleton<RemoteFavorites>(
    () => RemoteFavoritesImpl(
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
    () => SharedPreferencesImp(preferencesCore: sl()),
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
