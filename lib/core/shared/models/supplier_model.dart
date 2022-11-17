import 'package:daftary_app/core/shared/models/transaction_model.dart';

class SupplierModel {
  final int id;
  final String? name;
  final String? phone;
  final List<TransactionModel>? transactions;
  SupplierModel({required this.id, this.name, this.phone, this.transactions});
}
