import 'package:note_todo_app_mind_box/core/databases/local/database_consumer.dart';

class NotesLocalDataSource {
  NotesLocalDataSource(this._databaseConsumer);

  final DatabaseConsumer _databaseConsumer;

  Future<int> add(String table, {required Map<String, dynamic> data}) async {
    return await _databaseConsumer.addData(table, data: data);
  }

  Future<int> update(
    String table, {
    required Map<String, dynamic> data,
    required int id,
  }) async {
    return await _databaseConsumer.updateData(table, data: data, id: id);
  }

  Future<int> delete(String table, {required int id}) async {
    return await _databaseConsumer.deleteData(table, id: id);
  }

  Future<List<Map<String, dynamic>>> get(String table) async {
    return await _databaseConsumer.getData(table);
  }
}
