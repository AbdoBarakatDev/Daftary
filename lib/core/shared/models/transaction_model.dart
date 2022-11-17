class TransactionModel {
  final int transactionId;
  final double? transactionQuantity;
  final String? transactionType;
  TransactionModel(
      {required this.transactionId,
      this.transactionQuantity,
      this.transactionType});
}
