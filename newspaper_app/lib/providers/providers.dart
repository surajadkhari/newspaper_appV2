import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newspaper_app/model/news_mode.dart';
import 'package:newspaper_app/services/services_riverpod.dart';

final dataProvider = FutureProvider<NewsModel>((ref) async {
  return ref.read(networkdataserviceProvider).fetchNews();
});
