import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_and_apicalling/models/post_model.dart';
import 'package:riverpod_and_apicalling/services/api_services.dart';

final apiProvider = Provider<ApiServices>((ref) => ApiServices());
final postListProvider = FutureProvider<List<PostModel>>(
    (ref) => ref.read(apiProvider).getAllPost());
