enum PurchaseStatus {
  bought('bought'),
  notBought('notBought'),
  unknown('');

  final String status;

  const PurchaseStatus(this.status);

  static PurchaseStatus fromJson(String value) {
    return PurchaseStatus.values.firstWhere(
      (element) => element.status == value,
      orElse: () => PurchaseStatus.unknown,
    );
  }

  static String toJson(PurchaseStatus value) {
    return value.status;
  }
}
