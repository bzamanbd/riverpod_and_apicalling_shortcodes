import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        centerTitle: true,
      ),
      body: Center(child: Consumer(builder: (_, ref, __) {
        final postsData = ref.watch(postListProvider);
        return postsData.when(
          data: (data) => ListView.builder(
            itemBuilder: (_, index) => Card(
              elevation: 2,
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(data[index].id.toString()),
                ),
                title: Text(data[index].title.toString()),
                subtitle: Text(data[index].body.toString()),
                trailing: Text(data[index].userId.toString()),
              ),
            ),
            itemCount: data.length,
          ),
          error: (_, __) => Text(_.toString()),
          loading: () => const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(strokeWidth: 2),
              SizedBox(height: 16),
              Text('Loading......')
            ],
          ),
        );
      })),
    );
  }
}
