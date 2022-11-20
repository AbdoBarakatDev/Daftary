import 'package:daftary_app/core/shared/models/customer_model.dart';
import 'package:daftary_app/core/shared/models/supplier_model.dart';

class DummyData {
  static List<CustomerModel> customers = [
    CustomerModel(id: 1, name: "Abdo Barakat", give: 10, get: 0),
    CustomerModel(id: 2, name: "Ahmed Ali", give: 0, get: 200),
    CustomerModel(id: 3, name: "Salama Elzeki", give: 0, get: 0),
    CustomerModel(id: 4, name: "Mahmoud Salah", give: 50, get: 0),
    CustomerModel(id: 5, name: "Abeer Elsaid", give: 20, get: 0),
    CustomerModel(id: 6, name: "Jooo mayar", give: 10, get: 70),
    CustomerModel(id: 7, name: "Soso Ahmed", give: 700, get: 0),
  ];
  static List<SupplierModel> suppliers = [
    SupplierModel(id: 1, name: "Osama Elendy", give: 0, get: 2000),
    SupplierModel(id: 2, name: "Abdullah Mansour", give: 6000, get: 0),
    // CustomerModel(id: 3, name: "Salama Elzeki", give: 0, get: 0),
    // CustomerModel(id: 4, name: "Mahmoud Salah", give: 50, get: 0),
    // CustomerModel(id: 5, name: "Abeer Elsaid", give: 20, get: 0),
    // CustomerModel(id: 6, name: "Jooo mayar", give: 10, get: 70),
    // CustomerModel(id: 7, name: "Soso Ahmed", give: 700, get: 0),
  ];
}
