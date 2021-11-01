import 'package:bcvapp/src/blocs/bcvmonitor/login_bloc/login_bloc.dart';
import 'package:bcvapp/src/blocs/covid/covid_bloc.dart';
import 'package:bcvapp/src/models/covid_model.dart';
import 'package:bcvapp/src/models/login_model.dart';
import 'package:bcvapp/src/ui/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final LoginBloc _newsBloc = LoginBloc(const LoginInitial());

  @override
  void initState() {
    _newsBloc.add(LoginBCV());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginInitial) {
                return _buildLoading('Iniciando app');
              } else if (state is LoginLoading) {
                return _buildLoading('Verificando usuario..');
              } else if (state is LoginLoaded) {
                _toHomePage(context, 2);
                return _buildCard(context, state.loginModel);
              } else if (state is LoginCached) {
                _toHomePage(context, 1);
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (_) => MyHomePage()));
                return Container(
                  child: _buildLoading('Verificando'),
                );
              } else if (state is LoginError) {
                return Center(child: Text("Error"));
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, LoginModel model) {
    return Center(
      child: Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 80,
              ),
              Text(
                'Bienvenido ${model.usuario.name}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }

  Widget _buildLoading(String status) => Center(
          child: Container(
        width: 200,
        height: 200,
        child: LiquidCircularProgressIndicator(
          value: 0.75, // Defaults to 0.5.
          valueColor: AlwaysStoppedAnimation(
              Colors.black), // Defaults to the current Theme's accentColor.
          backgroundColor: Colors
              .white24, // Defaults to the current Theme's backgroundColor.
          borderColor: Colors.white54,
          borderWidth: 5.0,
          direction: Axis
              .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
          center: Text(
            status,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ));

  void _toHomePage(BuildContext context, int time) async {
    Future.delayed(Duration(seconds: time), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => MyHomePage()));
    });
  }
}
