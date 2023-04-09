import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/sources/files.dart';
import 'files_memory_impl.dart';

final filesProvider = Provider<Files>((ref) {
  return FilesMemoryImpl();
});