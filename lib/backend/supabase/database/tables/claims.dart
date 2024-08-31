import '../database.dart';

class ClaimsTable extends SupabaseTable<ClaimsRow> {
  @override
  String get tableName => 'claims';

  @override
  ClaimsRow createRow(Map<String, dynamic> data) => ClaimsRow(data);
}

class ClaimsRow extends SupabaseDataRow {
  ClaimsRow(super.data);

  @override
  SupabaseTable get table => ClaimsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get image64 => getField<String>('image_64');
  set image64(String? value) => setField<String>('image_64', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get parts => getField<String>('parts');
  set parts(String? value) => setField<String>('parts', value);
}
