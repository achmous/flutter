

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users_bloc/bloc/counter.bloc.dart';
import 'package:github_users_bloc/bloc/theme.bloc.dart';
import 'package:github_users_bloc/bloc/users.bloc.dart';
import 'package:github_users_bloc/ui/pages/root.view.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key?key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
providers: [
  BlocProvider(create: (context) => CounterBloc(),),
  BlocProvider(create: (context) => ThemeBloc()),
  BlocProvider(create: (context) => UsersBloc())
],
child:const RootView()
    );


  }
}


