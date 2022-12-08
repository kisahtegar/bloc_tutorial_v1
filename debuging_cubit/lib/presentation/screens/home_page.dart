import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/enum.dart';
import '../../logic/cubit/counter_cubit.dart';
import '../../logic/cubit/internet_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.title, this.color}) : super(key: key);

  final String? title;
  final Color? color;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext homeScreenContext) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title!),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/settings"),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // BlocBuilder
            BlocBuilder<InternetCubit, InternetState>(
              builder: (internetCubitBuilderContext, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return Text(
                    'WI-FI',
                    style: Theme.of(internetCubitBuilderContext)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.green),
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Mobile) {
                  return Text(
                    'Mobile',
                    style: Theme.of(internetCubitBuilderContext)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.red),
                  );
                } else if (state is InternetDisconnected) {
                  return Text(
                    'Disconnected',
                    style: Theme.of(internetCubitBuilderContext)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.grey),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),

            // BlocConsumer
            BlocConsumer<CounterCubit, CounterState>(
              // listener
              listener: (counterCubitListenerContext, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(counterCubitListenerContext)
                      .showSnackBar(
                    const SnackBar(
                      content: Text('Incremented +1'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else if (state.wasIncremented == false) {
                  ScaffoldMessenger.of(counterCubitListenerContext)
                      .showSnackBar(
                    const SnackBar(
                      content: Text('Decremented -1'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              // builder
              builder: (counterCubitBuilderContext, state) {
                if (state.counterValue < 0) {
                  return Text(
                    "Negative${state.counterValue}",
                    style: Theme.of(counterCubitBuilderContext)
                        .textTheme
                        .headline4,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    "Yaay, ${state.counterValue}",
                    style: Theme.of(counterCubitBuilderContext)
                        .textTheme
                        .headline4,
                  );
                } else {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(counterCubitBuilderContext)
                        .textTheme
                        .headline4,
                  );
                }
              },
            ),
            const SizedBox(height: 20),

            Builder(
              builder: (context) {
                final counterState = context.watch<CounterCubit>().state;
                final internetState = context.watch<InternetCubit>().state;

                if (internetState is InternetConnected &&
                    internetState.connectionType == ConnectionType.Mobile) {
                  return Text(
                    "Counter : ${counterState.counterValue} Internet : Mobile",
                    style: Theme.of(context).textTheme.headline6,
                  );
                } else if (internetState is InternetConnected &&
                    internetState.connectionType == ConnectionType.Wifi) {
                  return Text(
                    "Counter : ${counterState.counterValue} Internet : WI-FI",
                    style: Theme.of(context).textTheme.headline6,
                  );
                } else {
                  return Text(
                    "Counter : ${counterState.counterValue} Internet : Disconnected",
                    style: Theme.of(context).textTheme.headline6,
                  );
                }
              },
            ),

            const SizedBox(height: 20),

            Builder(
              builder: (context) {
                final counterValue = context
                    .select((CounterCubit cubit) => cubit.state.counterValue);
                return Text(
                  "Counter : $counterValue",
                  style: Theme.of(context).textTheme.headline6,
                );
              },
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    //context.read<CounterCubit>().increment();
                  },
                  tooltip: "Decrement",
                  heroTag: Text("${widget.title}"),
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    //BlocProvider.of<CounterCubit>(context).increment();
                    context.read<CounterCubit>().increment();
                  },
                  tooltip: "Increment",
                  heroTag: Text("${widget.title}"),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 24),

            //! Button to SECOND PAGE
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () {
                // Named routing
                Navigator.of(context).pushNamed('/SecondPage');
              },
              child: const Text(
                'Go to Second Screen',
                style: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 24),

            //! Button to THIRD PAGE
            MaterialButton(
              color: Colors.greenAccent,
              onPressed: () {
                // anonymous routing
                Navigator.of(context).pushNamed('/ThirdPage');
              },
              child: const Text(
                'Go to Third Screen',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
