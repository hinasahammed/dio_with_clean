import 'package:dio_with_clean/features/todo/presentation/providers/todos_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => fetch());
    super.initState();
  }

  void fetch() async {
    final viewmodel = ref.read(todosProviderProvider.notifier);
    await viewmodel.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Consumer(
        builder: (context, ref, child) {
          final todos = ref.watch(
            todosProviderProvider.select((value) => value.todos),
          );
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: todos
                  .map((e) => Card(child: ListTile(title: Text(e.title ?? ""))))
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
