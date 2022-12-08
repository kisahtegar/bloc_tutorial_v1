import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.title, this.color}) : super(key: key);

  final String? title;
  final Color? color;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title!)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("You have pushed the button this many times:"),

            // BlocConsumer
            BlocConsumer<CounterCubit, CounterState>(
              // listener
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incremented +1'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else if (state.wasIncremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Decremented -1'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              // builder
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    "Negative" + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    "Yaay, " + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              },
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: "Decrement",
                  heroTag: Text("${widget.title}"),
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
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
