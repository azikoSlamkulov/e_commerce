import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/module/auth/data/data_source/local/local_auth_data.dart';
import 'package:e_commerce/src/module/auth/data/data_source/remote/firebase_auth_data.dart';
import 'package:e_commerce/src/module/auth/data/data_source/remote/firebase_auth_with_firestore.dart';
import 'package:e_commerce/src/module/auth/data/repositories/auth_repo_impl.dart';
import 'package:e_commerce/src/module/auth/domain/repositories/auth_repo.dart';
import 'package:e_commerce/src/module/auth/domain/usecases/get_current_user.dart';
import 'package:e_commerce/src/module/auth/domain/usecases/sign_in_with_email.dart';
import 'package:e_commerce/src/module/auth/domain/usecases/sign_in_with_google.dart';
import 'package:e_commerce/src/module/auth/domain/usecases/sign_out.dart';
import 'package:e_commerce/src/module/auth/domain/usecases/sign_up.dart';
import 'package:e_commerce/src/module/auth/presentation/logic/auth_bloc.dart';
import 'package:e_commerce/src/module/home/data/data_source/remote/remote_product.dart';
import 'package:e_commerce/src/module/home/data/repositories/product_repo_impl.dart';
import 'package:e_commerce/src/module/home/domain/repositories/product_repo.dart';
import 'package:e_commerce/src/module/home/domain/usecases/get_all_products.dart';
import 'package:e_commerce/src/module/home/domain/usecases/get_all_sorted_products_by_query.dart';
import 'package:e_commerce/src/module/home/domain/usecases/get_roduct.dart';
import 'package:e_commerce/src/module/home/presention/logic/product_bloc.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'src/core/data/local/sharedpreferences/local_storage.dart';
import 'src/core/data/remote/firebase/firebase_auth.dart';
import 'src/core/data/remote/firebase/firestore.dart';

//import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // init splash
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  //FlutterNativeSplash.removeAfter(initialization);

  //Bloc
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

  sl.registerFactory(
    () => ProductBloc(
      getProduct: sl(),
      getAllProducts: sl(),
      getAllSortedProducts: sl(),
    ),
  );

  //Usecases
  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  //sl.registerLazySingleton(() => UpdateCurrentUser(sl()));
  sl.registerLazySingleton(() => SignInWithEmail(sl()));
  sl.registerLazySingleton(() => SignInWithGoogle(sl()));
  sl.registerLazySingleton(() => SignUp(sl()));
  sl.registerLazySingleton(() => SignOut(sl()));
  //sl.registerLazySingleton(() => GetUser(sl()));
  sl.registerLazySingleton(() => GetAllProducts(sl()));
  sl.registerLazySingleton(() => GetAllSortedProductsByQuery(sl()));
  sl.registerLazySingleton(() => GetProduct(sl()));

  //Repositories
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

  //datasource
  sl.registerLazySingleton<FirebaseAuthData>(
    () => FirebaseAuthDataImpl(
      firebaseAuth: sl(),
      firestore: sl(),
    ),
  );

  sl.registerLazySingleton<RemoteProduct>(
    () => RemoteProductImpl(
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
  // sl.registerLazySingleton<RemoteUser>(
  //   () => RemoteUserImpl(firestore: sl()),
  // );

  //Core
  sl.registerLazySingleton<FirebaseAuthCore>(
    () => FirebaseAuthCoreImpl(firebaseAuth: sl()),
  );
  sl.registerLazySingleton<FirestoreCore>(
    () => FirestoreCoreImpl(firestoreDB: sl()),
  );
  sl.registerLazySingleton<SharedPreferencesDB>(
    () => SharedPreferencesImp(preferencesCore: sl()),
  );

  //Extarnal
  /// Firebase
  final firebase = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  sl.registerLazySingleton(() => firebase);
  final firebaseAuthDB = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuthDB);
  final firestoreDB = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => firestoreDB);

  /// SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
