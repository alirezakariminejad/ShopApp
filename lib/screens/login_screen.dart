import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_application/bloc/authentication/auth_bloc.dart';
import 'package:flutter_shop_application/bloc/authentication/auth_event.dart';
import 'package:flutter_shop_application/bloc/authentication/auth_state.dart';
import 'package:flutter_shop_application/constants/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameTextConrtroller = TextEditingController(text: 'alirezakdl');
  final _passwordTextConrtroller = TextEditingController(text: 'alireza1403');

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login-back-img.webp'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 32.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(0, 30.0),
                blurRadius: 32.0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(32.0)),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 16.0,
                sigmaY: 16.0,
              ),
              child: IntrinsicHeight(
                child: Container(
                  color: const Color.fromRGBO(255, 255, 255, 0.75),
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Image(
                          image: AssetImage('assets/images/login-bag-icon.png'),
                          height: 100.0,
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'فروشگاه همراه',
                          style: TextStyle(
                            color: Color(0XFF455A64),
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(
                          height: 44.0,
                        ),
                        TextField(
                          controller: _usernameTextConrtroller,
                          decoration: const InputDecoration(
                            label: Text('نام کاربری'),
                            labelStyle: TextStyle(
                              color: shopGray,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              borderSide: BorderSide(color: shopGray),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                          controller: _passwordTextConrtroller,
                          decoration: const InputDecoration(
                            label: Text('کلمه عبور'),
                            labelStyle: TextStyle(
                              color: shopGray,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.25))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              borderSide: BorderSide(color: shopGray),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state is AuthInitState) {
                              return ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<AuthBloc>(context).add(
                                    AuthLoginRequestEvent(
                                      _usernameTextConrtroller.text,
                                      _passwordTextConrtroller.text,
                                    ),
                                  );
                                },
                                child: const Text('ورود  به حساب کاربری'),
                              );
                            }
                            if (state is AuthLoadingState) {
                              return const CircularProgressIndicator();
                            }
                            if (state is AuthResponseState) {
                              Text result = Text('');
                              state.response.fold(
                                (l) {
                                  result = Text(l);
                                },
                                (r) {
                                  result = Text(r);
                                },
                              );
                              return result;
                            }

                            return const Text('خطای نامشخص');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
