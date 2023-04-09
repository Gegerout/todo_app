abstract class Files {
  Future<String?> read(String path);

  Future<String?> write(String path, String content);

  Future<String?> delete(String path);
}