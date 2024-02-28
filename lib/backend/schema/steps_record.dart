import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StepsRecord extends FirestoreRecord {
  StepsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "step_no" field.
  int? _stepNo;
  int get stepNo => _stepNo ?? 0;
  bool hasStepNo() => _stepNo != null;

  // "step_image" field.
  String? _stepImage;
  String get stepImage => _stepImage ?? '';
  bool hasStepImage() => _stepImage != null;

  // "step_maintext" field.
  String? _stepMaintext;
  String get stepMaintext => _stepMaintext ?? '';
  bool hasStepMaintext() => _stepMaintext != null;

  // "step_subtext" field.
  String? _stepSubtext;
  String get stepSubtext => _stepSubtext ?? '';
  bool hasStepSubtext() => _stepSubtext != null;

  // "step_type" field.
  int? _stepType;
  int get stepType => _stepType ?? 0;
  bool hasStepType() => _stepType != null;

  // "step_time_min" field.
  int? _stepTimeMin;
  int get stepTimeMin => _stepTimeMin ?? 0;
  bool hasStepTimeMin() => _stepTimeMin != null;

  // "step_color_t" field.
  Color? _stepColorT;
  Color? get stepColorT => _stepColorT;
  bool hasStepColorT() => _stepColorT != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _stepNo = castToType<int>(snapshotData['step_no']);
    _stepImage = snapshotData['step_image'] as String?;
    _stepMaintext = snapshotData['step_maintext'] as String?;
    _stepSubtext = snapshotData['step_subtext'] as String?;
    _stepType = castToType<int>(snapshotData['step_type']);
    _stepTimeMin = castToType<int>(snapshotData['step_time_min']);
    _stepColorT = getSchemaColor(snapshotData['step_color_t']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('steps')
          : FirebaseFirestore.instance.collectionGroup('steps');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('steps').doc(id);

  static Stream<StepsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StepsRecord.fromSnapshot(s));

  static Future<StepsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StepsRecord.fromSnapshot(s));

  static StepsRecord fromSnapshot(DocumentSnapshot snapshot) => StepsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StepsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StepsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StepsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StepsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStepsRecordData({
  int? stepNo,
  String? stepImage,
  String? stepMaintext,
  String? stepSubtext,
  int? stepType,
  int? stepTimeMin,
  Color? stepColorT,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'step_no': stepNo,
      'step_image': stepImage,
      'step_maintext': stepMaintext,
      'step_subtext': stepSubtext,
      'step_type': stepType,
      'step_time_min': stepTimeMin,
      'step_color_t': stepColorT,
    }.withoutNulls,
  );

  return firestoreData;
}

class StepsRecordDocumentEquality implements Equality<StepsRecord> {
  const StepsRecordDocumentEquality();

  @override
  bool equals(StepsRecord? e1, StepsRecord? e2) {
    return e1?.stepNo == e2?.stepNo &&
        e1?.stepImage == e2?.stepImage &&
        e1?.stepMaintext == e2?.stepMaintext &&
        e1?.stepSubtext == e2?.stepSubtext &&
        e1?.stepType == e2?.stepType &&
        e1?.stepTimeMin == e2?.stepTimeMin &&
        e1?.stepColorT == e2?.stepColorT;
  }

  @override
  int hash(StepsRecord? e) => const ListEquality().hash([
        e?.stepNo,
        e?.stepImage,
        e?.stepMaintext,
        e?.stepSubtext,
        e?.stepType,
        e?.stepTimeMin,
        e?.stepColorT
      ]);

  @override
  bool isValidKey(Object? o) => o is StepsRecord;
}
