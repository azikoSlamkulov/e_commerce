// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreCollections {
//   static FirestoreCollections? _firestoreCollections;
//   static late FirebaseFirestore _firestore;

//   static FirestoreCollections getInstance() {
//     if (_firestoreCollections == null) {
//       final firestoreCollections = FirestoreCollections._();
//       firestoreCollections._init();
//       _firestoreCollections = firestoreCollections;
//     }
//     return _firestoreCollections!;
//   }

//   FirestoreCollections._();

//   void _init() {
//     _firestore = FirebaseFirestore.instance;
//   }

//   static final CollectionReference usersCollections =
//       _firestore.collection("users");
//   static final CollectionReference profileCollections =
//       _firestore.collection("profile");
//   static final CollectionReference wageCollections =
//       _firestore.collection("wage");
//   static final CollectionReference planeCollections =
//       _firestore.collection("plane");
// }
