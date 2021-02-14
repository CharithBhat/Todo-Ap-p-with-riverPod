import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Example. ok ok')),
        body: Center(child: Consumer(builder: (context, watch, _) {
          final count = watch(counterProvider).state;
          return Text('$count');
        })),
        floatingActionButton: FloatingActionButton(
          // The read method is an utility to read a provider without listening to it
          onPressed: () => context.read(counterProvider).state++,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
