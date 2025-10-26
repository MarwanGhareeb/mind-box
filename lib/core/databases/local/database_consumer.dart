abstract class DatabaseConsumer {
  Future<int> addData(String table, {required Map<String, dynamic> data});
  Future<int> updateData(
    String table, {
    required Map<String, dynamic> data,
    required int id,
  });
  Future<int> deleteData(String table, {required int id});
  Future<List<Map<String, dynamic>>> getData(String table, {String? title});
}
