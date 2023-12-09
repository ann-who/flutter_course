import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/data_layer/data_source/purchases_data_source.dart';
import 'package:firebase/data_layer/models/purchase/purchase_model.dart';
import 'package:firebase/data_layer/models/purchase_status.dart';
import 'package:firebase/resources/exceptions/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebasePurchasesDataSource implements PurchasesDataSource {
  @override
  Future<List<PurchaseModel>> loadPurchases() async {
    final purchasesDb = FirebaseFirestore.instance.collection('purchases');
    String userId = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot? purchases;
    List<PurchaseModel> existingPurchases = [];

    try {
      purchases = await purchasesDb.where('userId', isEqualTo: userId).get();
    } on FirebaseException catch (e, s) {
      logger.e('Loading error', error: e, stackTrace: s);

      return Future.error(Exception('Loading error'));
    }

    existingPurchases = purchases.docs
        .map(
            (doc) => PurchaseModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    return existingPurchases;
  }

  @override
  Future<String> createPurchase(PurchaseModel task) async {
    final purchasesDb = FirebaseFirestore.instance.collection('purchases');
    try {
      DocumentReference docRef = await purchasesDb.add(task.toJson());
      purchasesDb.doc(docRef.id).update({'databaseId': docRef.id});
      return docRef.id;
    } on FirebaseException catch (e, s) {
      logger.e('Create error', error: e, stackTrace: s);

      return Future.error(Exception('Create error'));
    }
  }

  @override
  Future<void> deletePurchase(String id) async {
    final purchasesDb = FirebaseFirestore.instance.collection('purchases');
    try {
      purchasesDb.doc(id).delete();
    } on FirebaseException catch (e, s) {
      logger.e('Delete error', error: e, stackTrace: s);

      return Future.error(Exception('Delete error'));
    }
  }

  @override
  Future<void> updatePurchase(String id, PurchaseStatus newStatus) async {
    final purchasesDb = FirebaseFirestore.instance.collection('purchases');
    try {
      purchasesDb.doc(id).update({'status': newStatus.status});
    } on FirebaseException catch (e, s) {
      logger.e('Update error', error: e, stackTrace: s);

      return Future.error(Exception('Update error'));
    }
  }

  @override
  Future<List<PurchaseModel>> sortNameDescending() async {
    return <PurchaseModel>[];
  }

  @override
  Future<List<PurchaseModel>> sortNameAscending() async {
    return <PurchaseModel>[];
  }

  @override
  Future<List<PurchaseModel>> showBought() async {
    return <PurchaseModel>[];
  }

  @override
  Future<List<PurchaseModel>> showNotBought() async {
    return <PurchaseModel>[];
  }

  // purchases = await purchasesDb
  //         .where('userId', isEqualTo: userId)
  //         .orderBy('name')
  //         .get();
}
