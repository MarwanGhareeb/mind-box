abstract class DatabaseConsumer {
  Future<int> addData(String table, {required Map<String, dynamic> data});
  Future<int> updateData(
    String table, {
    required Map<String, dynamic> data,
    String? where,
    List<Object?>? whereArgs,
  });
  Future<int> deleteData(
    String table, {
    String? where,
    List<Object?>? whereArgs,
  });
  Future<List<Map<String, dynamic>>> getData(String table);
}
