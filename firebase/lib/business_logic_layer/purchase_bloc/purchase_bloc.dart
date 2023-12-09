import 'package:firebase/data_layer/models/purchase/purchase_model.dart';
import 'package:firebase/data_layer/models/purchase_status.dart';
import 'package:firebase/data_layer/repository/purchases_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_bloc.freezed.dart';
part 'purchase_event.dart';
part 'purchase_state.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState> {
  final PurchasesRepository purchasesRepository;

  PurchaseBloc({required this.purchasesRepository})
      : super(const PurchaseState()) {
    on<PurchasesListLoaded>(_onPurchasesListLoaded);
    on<PurchaseCreated>(_onPurchaseCreated);
    on<PurchaseDeleted>(_onPurchaseDeleted);
    on<PurchaseStatusChanged>(_onPurchaseStatusChanged);
    on<UserSignedOut>(_onUserSignedOut);
  }

  void _onPurchasesListLoaded(
    PurchasesListLoaded event,
    Emitter<PurchaseState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      var updatedPurchases = await purchasesRepository.loadPurchases();

      emit(
        state.copyWith(
          isLoading: false,
          purchases: updatedPurchases,
          error: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  void _onPurchaseCreated(
    PurchaseCreated event,
    Emitter<PurchaseState> emit,
  ) async {
    var updatedPurchases = List<PurchaseModel>.from(state.purchases);

    try {
      var createdPurchaseId =
          await purchasesRepository.createPurchase(event.purchase);
      var updatedPurchase = event.purchase.copyWith(id: createdPurchaseId);

      updatedPurchases.insert(0, updatedPurchase);

      emit(
        state.copyWith(
          purchases: updatedPurchases,
          error: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  void _onPurchaseDeleted(
    PurchaseDeleted event,
    Emitter<PurchaseState> emit,
  ) async {
    var updatedPurchases = List<PurchaseModel>.from(state.purchases);
    int elementIndex =
        updatedPurchases.indexWhere((purchase) => purchase.id == event.id);

    if (elementIndex == -1) {
      emit(state.copyWith(error: Exception('Delete error')));
      throw Exception('Delete error');
    }

    updatedPurchases.removeAt(elementIndex);

    try {
      await purchasesRepository.deletePurchase(event.id);

      emit(
        state.copyWith(
          purchases: updatedPurchases,
          error: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  void _onPurchaseStatusChanged(
    PurchaseStatusChanged event,
    Emitter<PurchaseState> emit,
  ) async {
    var updatedPurchases = List<PurchaseModel>.from(state.purchases);
    var updatedPurchaseIndex = updatedPurchases.indexOf(event.purchase);
    var nextStatus = PurchaseStatus.bought;

    var purchaseNeededUpdate =
        updatedPurchases.elementAt(updatedPurchaseIndex).copyWith(
              status: nextStatus,
            );

    updatedPurchases[updatedPurchaseIndex] = purchaseNeededUpdate;
    try {
      await purchasesRepository.updatePurchase(event.purchase.id, nextStatus);

      emit(
        state.copyWith(
          purchases: updatedPurchases,
          error: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  void _onUserSignedOut(
    UserSignedOut event,
    Emitter<PurchaseState> emit,
  ) {
    emit(
      state.copyWith(
        purchases: [],
        isLoading: true,
        error: null,
      ),
    );
  }
}
