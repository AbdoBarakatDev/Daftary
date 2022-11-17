import 'dart:developer';

import 'package:daftary_app/core/shared/models/customer_model.dart';

import 'package:daftary_app/modules/customers_module/home_feature/controller/home_screen_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());
  static HomeScreenCubit get(BuildContext context) => BlocProvider.of(context);
  String customersTableName = "customers";
  String customersTableColumnId = "id";
  String customersTableColumnName = "name";
  String customersTableColumnLinkedTableId = "user_id";
  String customersTableColumnPhone = "phone";
  String customersTableColumnGet = "get";
  String customersTableColumnGive = "give";
  Database? database;

/*
CREATE TABLE curren_user (id INTEGER PRIMARY KEY,name TEXT,phone TEXT,email TEXT,pin_code TEXT);
*/

  List<Map> listCustomers = [];
  createCustomersDatabase() async {
    await openDatabase(
      "myDaftar.db",
      version: 1,
      onCreate: (db, version) {
        db
            .execute(
                "CREATE TABLE $customersTableName ($customersTableColumnId INTEGER PRIMARY KEY,$customersTableColumnLinkedTableId INTEGER,$customersTableColumnName TEXT,$customersTableColumnPhone TEXT,$customersTableColumnGet REAL,$customersTableColumnGive REAL")
            .then((value) => print("Custoomer Database Successfully Created"))
            .onError((error, stackTrace) =>
                print("Database Error Creation ${error.toString()}"));
      },
      onOpen: (db) {
        getDataFromDB(db);
        print("Database Opened");
      },
    ).then((value) {
      database = value;
      emit(CreateCustomersDataBaseSuccessState());
    });
  }

  void getDataFromDB(Database db) async {
    listCustomers = [];
    emit(GetCustomersDataBaseLoadingState());
    await db.rawQuery("SELECT * FROM $customersTableName").then((value) {
      for (var element in value) {
        listCustomers.add(element);
        log(element["id"].toString());
        log(element["name"].toString());
        log(element["get"].toString());
        log(element["give"].toString());
      }
      log(listCustomers.toString());
      emit(GetCustomersDataBaseSuccessState());
      // print("New Tasks is $newTasks");
      // print("done Tasks is $doneTasks");
      // print("archived Tasks is $archivedTasks");
    });
  }

  void insertInCustomers(CustomerModel customerModel) async {
    await database!
        .transaction((txn) => txn
                .rawInsert(
                    "INSERT INTO $customersTableName ($customersTableColumnName ,$customersTableColumnPhone ,$customersTableColumnGet ,$customersTableColumnGive) VALUES (${customerModel.name},${customerModel.phone},${customerModel.get},${customerModel.give}) ")
                .then((value) => {
                      log("value of insert :  $value"),
                      emit(InsertCustomersDataBaseSuccessState())
                    })
                .catchError((error, stackTrace) {
              log("Error while inserting a Row Error :${error.toString()}");
            }))
        .then((value) {
      getDataFromDB(database!);
    });
  }
}
