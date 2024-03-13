import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStoriesRecord extends FirestoreRecord {
  UserStoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "storyVideo" field.
  String? _storyVideo;
  String get storyVideo => _storyVideo ?? '';
  bool hasStoryVideo() => _storyVideo != null;

  // "storyPhoto" field.
  String? _storyPhoto;
  String get storyPhoto => _storyPhoto ?? '';
  bool hasStoryPhoto() => _storyPhoto != null;

  // "storyDescription" field.
  String? _storyDescription;
  String get storyDescription => _storyDescription ?? '';
  bool hasStoryDescription() => _storyDescription != null;

  // "storyPostedAt" field.
  DateTime? _storyPostedAt;
  DateTime? get storyPostedAt => _storyPostedAt;
  bool hasStoryPostedAt() => _storyPostedAt != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "numComments" field.
  int? _numComments;
  int get numComments => _numComments ?? 0;
  bool hasNumComments() => _numComments != null;

  // "isOwner" field.
  bool? _isOwner;
  bool get isOwner => _isOwner ?? false;
  bool hasIsOwner() => _isOwner != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _storyVideo = snapshotData['storyVideo'] as String?;
    _storyPhoto = snapshotData['storyPhoto'] as String?;
    _storyDescription = snapshotData['storyDescription'] as String?;
    _storyPostedAt = snapshotData['storyPostedAt'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _numComments = castToType<int>(snapshotData['numComments']);
    _isOwner = snapshotData['isOwner'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userStories');

  static Stream<UserStoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserStoriesRecord.fromSnapshot(s));

  static Future<UserStoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserStoriesRecord.fromSnapshot(s));

  static UserStoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserStoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserStoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserStoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserStoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserStoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserStoriesRecordData({
  DocumentReference? user,
  String? storyVideo,
  String? storyPhoto,
  String? storyDescription,
  DateTime? storyPostedAt,
  int? numComments,
  bool? isOwner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'storyVideo': storyVideo,
      'storyPhoto': storyPhoto,
      'storyDescription': storyDescription,
      'storyPostedAt': storyPostedAt,
      'numComments': numComments,
      'isOwner': isOwner,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserStoriesRecordDocumentEquality implements Equality<UserStoriesRecord> {
  const UserStoriesRecordDocumentEquality();

  @override
  bool equals(UserStoriesRecord? e1, UserStoriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        e1?.storyVideo == e2?.storyVideo &&
        e1?.storyPhoto == e2?.storyPhoto &&
        e1?.storyDescription == e2?.storyDescription &&
        e1?.storyPostedAt == e2?.storyPostedAt &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.numComments == e2?.numComments &&
        e1?.isOwner == e2?.isOwner;
  }

  @override
  int hash(UserStoriesRecord? e) => const ListEquality().hash([
        e?.user,
        e?.storyVideo,
        e?.storyPhoto,
        e?.storyDescription,
        e?.storyPostedAt,
        e?.likes,
        e?.numComments,
        e?.isOwner
      ]);

  @override
  bool isValidKey(Object? o) => o is UserStoriesRecord;
}
