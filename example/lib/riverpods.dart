import 'package:example/counter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider<CounterProvider, int>((ref) => CounterProvider());
