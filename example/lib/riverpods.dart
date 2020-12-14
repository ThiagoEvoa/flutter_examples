import 'package:example/counter_provider.dart';
import 'package:flutter_riverpod/all.dart';

final counterProvider = StateNotifierProvider((ref) => CounterProvider());
