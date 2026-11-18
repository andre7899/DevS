import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';
import 'package:cinemapedia/infrastructure_data/datasources/drift_datasource.dart';
import 'package:cinemapedia/infrastructure_data/repositories/local_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider<LocalStorageRepository>((ref) {
  return LocalStorageRepositoryImpl(DriftDatasource());
});
