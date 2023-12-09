part of 'purchase_bloc.dart';

abstract class PurchaseEvent {}

class PurchasesListLoaded extends PurchaseEvent {
  PurchasesListLoaded();
}

class PurchaseCreated extends PurchaseEvent {
  final PurchaseModel purchase;

  PurchaseCreated({required this.purchase});
}

class PurchaseDeleted extends PurchaseEvent {
  final String id;

  PurchaseDeleted({required this.id});
}

class PurchaseStatusChanged extends PurchaseEvent {
  final PurchaseModel purchase;

  PurchaseStatusChanged({required this.purchase});
}

class UserSignedOut extends PurchaseEvent {
  UserSignedOut();
}
