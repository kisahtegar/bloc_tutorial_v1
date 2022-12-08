import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, this.title, this.color}) : super(key: key);

  final String? title;
  final Color? color;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title!),
      ),
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
                  backgroundColor: widget.color,
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: "Increment",
                  heroTag: Text("${widget.title}"),
                  child: const Icon(Icons.add),
                  backgroundColor: widget.color,
                ),
              ],
            ),
            const SizedBox(height: 24),

            MaterialButton(
              color: widget.color,
              onPressed: () {},
              child: const Text(
                'Go to second screen',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
