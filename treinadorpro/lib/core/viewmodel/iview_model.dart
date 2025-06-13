import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/domain/repositories/repository.dart';

abstract class IViewModel<T> extends StateNotifier<AsyncValue<T>> {
  final Repository _repository;
  IViewModel(this._repository) : super(AsyncValue.loading());
}