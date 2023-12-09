import 'package:firebase/data_layer/data_source/purchases_data_source.dart';
import 'package:firebase/data_layer/models/purchase/purchase_model.dart';
import 'package:firebase/data_layer/models/purchase_status.dart';
import 'package:firebase/data_layer/repository/purchases_repository.dart';

class PurchasesRepositoryImplementation implements PurchasesRepository {
  final PurchasesDataSource purchasesDataSource;

  const PurchasesRepositoryImplementation({required this.purchasesDataSource});

  @override
  Future<List<PurchaseModel>> loadPurchases() async {
    return await purchasesDataSource.loadPurchases();
  }

  @override
  Future<String> createPurchase(PurchaseModel task) async {
    return await purchasesDataSource.createPurchase(task);
  }

  @override
  Future<void> deletePurchase(String id) async {
    return await purchasesDataSource.deletePurchase(id);
  }

  @override
  Future<void> updatePurchase(String id, PurchaseStatus newStatus) async {
    return await purchasesDataSource.updatePurchase(id, newStatus);
  }

  @override
  Future<List<PurchaseModel>> sortNameDescending() async {
    return await purchasesDataSource.sortNameDescending();
  }

  @override
  Future<List<PurchaseModel>> sortNameAscending() async {
    return await purchasesDataSource.sortNameAscending();
  }

  @override
  Future<List<PurchaseModel>> showBought() async {
    return await purchasesDataSource.showBought();
  }

  @override
  Future<List<PurchaseModel>> showNotBought() async {
    return await purchasesDataSource.showNotBought();
  }
}
