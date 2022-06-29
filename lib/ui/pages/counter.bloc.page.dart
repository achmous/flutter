import 'package:flutter/material.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users_bloc/bloc/counter.bloc.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Bloc"),

      ),
      body: Center(
        child: BlocBuilder<CounterBloc,CounterState>
          (builder: (context, state) {
            if(state is CounterSuccessState){
              return Text(
                  "Counter value => ${state.counter}",
                style: Theme.of(context).textTheme.headline5,
              );
            }
           else if(state is CounterErrorState){
              return Column(
                children: [
                Text(
              "Counter value => ${state.counter}",
                style: Theme.of(context).textTheme.headline5,
              ),
            Text(
          "C${state.errorMessage}",
          style: Theme.of(context).textTheme.headline6,
          )
                ],
              );
            }
           else{
              return Text("data");
            }
        }),
      ),
    );
  }
}
