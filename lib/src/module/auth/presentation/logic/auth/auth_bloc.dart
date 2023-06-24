import 'package:e_commerce/lib.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetCurrentUser getCurrentUser;
  final SignInWithEmail signInWithEmail;
  final SignInWithGoogle signInWithGoogle;
  final SignUp signUp;
  final SignOut signOut;

  AuthBloc({
    required this.getCurrentUser,
    required this.signInWithEmail,
    required this.signInWithGoogle,
    required this.signUp,
    required this.signOut,
  }) : super(UnAuthenticatedState()) {
    on<GetCurrentUserEvent>(_getCurrentUser);
    on<SignInWithEmailEvent>(_signInWithEmail);
    on<SignInWithGoogleEvent>(_signInWithGoogle);
    on<SignOutEvent>(_signOut);
    on<CancelEvent>(_cancel);
    on<SignUpEvent>(_signUp);
    on<OpenSignUpEvent>(_openSignUp);
    on<OpenSignInEvent>(_openSignIn);
    on<OpenPasswordRecoveryEvent>(_openPasswordRecovery);
  }

  void _cancel(CancelEvent event, Emitter<AuthState> emit) {
    emit(UnAuthenticatedState());
  }

  void _openSignUp(OpenSignUpEvent event, Emitter<AuthState> emit) {
    emit(OpenSignUpState());
  }

  void _openSignIn(OpenSignInEvent event, Emitter<AuthState> emit) {
    emit(OpenSignInState());
  }

  void _openPasswordRecovery(
      OpenPasswordRecoveryEvent event, Emitter<AuthState> emit) {
    emit(OpenPasswordRecoveryState());
  }

  void _getCurrentUser(
    GetCurrentUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    final currentUser = await getCurrentUser.getCurrentUser();
    currentUser.fold(
      (error) => emit(const AuthenticationFailureState('')),
      (user) {
        if (user != null) {
          emit(AuthenticatedState(user));
        } else {
          emit(UnAuthenticatedState());
        }
      },
    );
  }

  void _signInWithEmail(
      SignInWithEmailEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final user = await signInWithEmail(
      SignInWithEmailParams(
        email: event.email,
        password: event.password,
      ),
    );
    user.fold(
      (error) => emit(const AuthenticationFailureState('')),
      (user) => emit(AuthenticatedState(user)),
    );
  }

  void _signInWithGoogle(
      SignInWithGoogleEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final user = await signInWithGoogle.signInWithGoogle();
    user.fold(
      (error) => emit(const AuthenticationFailureState('')),
      (user) => emit(AuthenticatedState(user)),
    );
  }

  void _signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final userCredential = await signUp(
      SignUpParams(
        email: event.email,
        password: event.password,
      ),
    );
    await userCredential.fold(
      (error) async => emit(const AuthenticationFailureState('')),
      (user) async => emit(AuthenticatedState(user)),
    );
  }

  void _signOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final isSignedOut = await signOut.signOut();
    isSignedOut.fold(
      (error) => emit(const AuthenticationFailureState('')),
      (isSignedOut) {
        if (isSignedOut!) {
          emit(UnAuthenticatedState());
        }
      },
    );
  }
}
