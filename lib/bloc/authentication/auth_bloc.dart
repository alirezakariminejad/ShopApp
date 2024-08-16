import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_application/bloc/authentication/auth_event.dart';
import 'package:flutter_shop_application/bloc/authentication/auth_state.dart';
import 'package:flutter_shop_application/data/repository/authentication_repository.dart';
import 'package:flutter_shop_application/di/di.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthenticationRepository _repository = locator.get();
  AuthBloc() : super(AuthInitState()) {
    on<AuthLoginRequestEvent>(
      (event, emit) async {
        emit(AuthInitState());
        var response = await _repository.login(event.username, event.password);
        emit(AuthResponseState(response));
      },
    );
  }
}
