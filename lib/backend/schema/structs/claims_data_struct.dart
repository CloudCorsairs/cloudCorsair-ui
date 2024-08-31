// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ClaimsDataStruct extends FFFirebaseStruct {
  ClaimsDataStruct({
    int? id,
    String? name,
    String? userId,
    String? status,
    DateTime? createdAt,
    String? image,
    String? imageUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _userId = userId,
        _status = status,
        _createdAt = createdAt,
        _image = image,
        _imageUrl = imageUrl,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  static ClaimsDataStruct fromMap(Map<String, dynamic> data) =>
      ClaimsDataStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        userId: data['user_id'] as String?,
        status: data['status'] as String?,
        createdAt: data['created_at'] as DateTime?,
        image: data['image'] as String?,
        imageUrl: data['image_url'] as String?,
      );

  static ClaimsDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ClaimsDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'user_id': _userId,
        'status': _status,
        'created_at': _createdAt,
        'image': _image,
        'image_url': _imageUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'image_url': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static ClaimsDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ClaimsDataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        imageUrl: deserializeParam(
          data['image_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ClaimsDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ClaimsDataStruct &&
        id == other.id &&
        name == other.name &&
        userId == other.userId &&
        status == other.status &&
        createdAt == other.createdAt &&
        image == other.image &&
        imageUrl == other.imageUrl;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, userId, status, createdAt, image, imageUrl]);
}

ClaimsDataStruct createClaimsDataStruct({
  int? id,
  String? name,
  String? userId,
  String? status,
  DateTime? createdAt,
  String? image,
  String? imageUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ClaimsDataStruct(
      id: id,
      name: name,
      userId: userId,
      status: status,
      createdAt: createdAt,
      image: image,
      imageUrl: imageUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ClaimsDataStruct? updateClaimsDataStruct(
  ClaimsDataStruct? claimsData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    claimsData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addClaimsDataStructData(
  Map<String, dynamic> firestoreData,
  ClaimsDataStruct? claimsData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (claimsData == null) {
    return;
  }
  if (claimsData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && claimsData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final claimsDataData = getClaimsDataFirestoreData(claimsData, forFieldValue);
  final nestedData = claimsDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = claimsData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getClaimsDataFirestoreData(
  ClaimsDataStruct? claimsData, [
  bool forFieldValue = false,
]) {
  if (claimsData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(claimsData.toMap());

  // Add any Firestore field values
  claimsData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getClaimsDataListFirestoreData(
  List<ClaimsDataStruct>? claimsDatas,
) =>
    claimsDatas?.map((e) => getClaimsDataFirestoreData(e, true)).toList() ?? [];
