import 'package:firebase/data_layer/models/purchase/purchase_model.dart';
import 'package:firebase/data_layer/models/purchase_status.dart';

abstract class PurchasesDataSource {
  Future<List<PurchaseModel>> loadPurchases();
  Future<String> createPurchase(PurchaseModel task);
  Future<void> deletePurchase(String id);
  Future<void> updatePurchase(String id, PurchaseStatus newStatus);
  Future<List<PurchaseModel>> sortNameDescending();
  Future<List<PurchaseModel>> sortNameAscending();
  Future<List<PurchaseModel>> showBought();
  Future<List<PurchaseModel>> showNotBought();
}
