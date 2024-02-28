import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecipesRecord extends FirestoreRecord {
  RecipesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "short_description" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "long_description" field.
  String? _longDescription;
  String get longDescription => _longDescription ?? '';
  bool hasLongDescription() => _longDescription != null;

  // "cook_time_min" field.
  int? _cookTimeMin;
  int get cookTimeMin => _cookTimeMin ?? 0;
  bool hasCookTimeMin() => _cookTimeMin != null;

  // "prep_time_min" field.
  int? _prepTimeMin;
  int get prepTimeMin => _prepTimeMin ?? 0;
  bool hasPrepTimeMin() => _prepTimeMin != null;

  // "total_time_min" field.
  int? _totalTimeMin;
  int get totalTimeMin => _totalTimeMin ?? 0;
  bool hasTotalTimeMin() => _totalTimeMin != null;

  // "card_image" field.
  String? _cardImage;
  String get cardImage => _cardImage ?? '';
  bool hasCardImage() => _cardImage != null;

  // "details_image" field.
  String? _detailsImage;
  String get detailsImage => _detailsImage ?? '';
  bool hasDetailsImage() => _detailsImage != null;

  // "ingredients" field.
  List<String>? _ingredients;
  List<String> get ingredients => _ingredients ?? const [];
  bool hasIngredients() => _ingredients != null;

  // "is_favorite" field.
  bool? _isFavorite;
  bool get isFavorite => _isFavorite ?? false;
  bool hasIsFavorite() => _isFavorite != null;

  // "step_count" field.
  int? _stepCount;
  int get stepCount => _stepCount ?? 0;
  bool hasStepCount() => _stepCount != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _shortDescription = snapshotData['short_description'] as String?;
    _longDescription = snapshotData['long_description'] as String?;
    _cookTimeMin = castToType<int>(snapshotData['cook_time_min']);
    _prepTimeMin = castToType<int>(snapshotData['prep_time_min']);
    _totalTimeMin = castToType<int>(snapshotData['total_time_min']);
    _cardImage = snapshotData['card_image'] as String?;
    _detailsImage = snapshotData['details_image'] as String?;
    _ingredients = getDataList(snapshotData['ingredients']);
    _isFavorite = snapshotData['is_favorite'] as bool?;
    _stepCount = castToType<int>(snapshotData['step_count']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recipes');

  static Stream<RecipesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecipesRecord.fromSnapshot(s));

  static Future<RecipesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecipesRecord.fromSnapshot(s));

  static RecipesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecipesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecipesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecipesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecipesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecipesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecipesRecordData({
  String? name,
  String? shortDescription,
  String? longDescription,
  int? cookTimeMin,
  int? prepTimeMin,
  int? totalTimeMin,
  String? cardImage,
  String? detailsImage,
  bool? isFavorite,
  int? stepCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'short_description': shortDescription,
      'long_description': longDescription,
      'cook_time_min': cookTimeMin,
      'prep_time_min': prepTimeMin,
      'total_time_min': totalTimeMin,
      'card_image': cardImage,
      'details_image': detailsImage,
      'is_favorite': isFavorite,
      'step_count': stepCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecipesRecordDocumentEquality implements Equality<RecipesRecord> {
  const RecipesRecordDocumentEquality();

  @override
  bool equals(RecipesRecord? e1, RecipesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.longDescription == e2?.longDescription &&
        e1?.cookTimeMin == e2?.cookTimeMin &&
        e1?.prepTimeMin == e2?.prepTimeMin &&
        e1?.totalTimeMin == e2?.totalTimeMin &&
        e1?.cardImage == e2?.cardImage &&
        e1?.detailsImage == e2?.detailsImage &&
        listEquality.equals(e1?.ingredients, e2?.ingredients) &&
        e1?.isFavorite == e2?.isFavorite &&
        e1?.stepCount == e2?.stepCount;
  }

  @override
  int hash(RecipesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.shortDescription,
        e?.longDescription,
        e?.cookTimeMin,
        e?.prepTimeMin,
        e?.totalTimeMin,
        e?.cardImage,
        e?.detailsImage,
        e?.ingredients,
        e?.isFavorite,
        e?.stepCount
      ]);

  @override
  bool isValidKey(Object? o) => o is RecipesRecord;
}
