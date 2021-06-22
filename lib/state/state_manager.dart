import 'package:flutter_riverpode/model/model.dart';
import 'package:flutter_riverpode/services/fetch_api.dart';
import 'package:riverpod/all.dart';

/// A provider that asynchronously expose the current data.
final photostateFuture = FutureProvider<List<PhotoModel>>((ref) async {
  return fetchPhotos();
});
