import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpode/model/model.dart';
import 'package:flutter_riverpode/state/state_manager.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context,
      T Function<T>(ProviderBase<Object, T> provider) watch) {
    AsyncValue<List<PhotoModel>> photos = watch(photostateFuture);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('Fetching API'),
      ),
      body: photos.when(
        loading: () => Center(
            child: CircularProgressIndicator(
          backgroundColor: Colors.deepPurple,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurpleAccent),
        )),
        error: (error, stack) => Center(child: Text('${error.toString()}')),
        data: (value) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Card(
                    child: Image.network(value[index].url),
                  ),
                  Text(value[index].title),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
