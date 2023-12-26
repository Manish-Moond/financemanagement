import 'package:financemanagement/src/data/datasource/firebase_data_source.dart';
import 'package:financemanagement/src/data/repository/firebase_repository_impl.dart';
import 'package:financemanagement/src/domain/repository/firebase_repository.dart';
import 'package:financemanagement/src/domain/usecases/login_usecase.dart';
import 'package:financemanagement/src/domain/usecases/signup_usecase.dart';
import 'package:financemanagement/src/presentation/auth/cubit/auth_cubit.dart';
import 'package:financemanagement/src/presentation/home/cubit/transaction_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
      () => AuthCubit(loginUseCase: sl.call(), signupUseCase: sl.call()));

  sl.registerFactory(() => TransactionCubit());

  // usecases
  sl.registerLazySingleton(() => LoginUseCase(firebaseRepository: sl.call()));
  sl.registerLazySingleton(() => SignupUseCase(firebaseRepository: sl.call()));

  // Repositories
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(firebaseDataSource: sl.call()));

  // Data sources
  sl.registerLazySingleton(() => FirebaseDataSource(prefs: sl.call()));

    // Externals
  sl.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
}
