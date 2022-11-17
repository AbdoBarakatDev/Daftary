import 'package:daftary_app/modules/customers_module/home_feature/controller/home_layout_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeLayoutInitialState());
  static HomeLayoutCubit get(BuildContext context) => BlocProvider.of(context);
  String currentUserTableName = "currentUser";
  String currentUserTableColumnId = "id";
  String currentUserTableColumnName = "name";
  String currentUserTableColumnPhone = "phone";
  String currentUserTableColumnEmail = "email";
  String currentUserTableColumnPinCode = "pinCode";
  Database? database;

  // saveCurrentUserData(UserModel userModel) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   Map<String, dynamic> user = userModel.toJson();

  //   await preferences.setString("user", jsonEncode(user)).then((value) {
  //     log(value.toString());
  //   }).catchError((e) {
  //     log(e.message);
  //   });
  // }

  // getUserData() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   log("======> ${pref.getString('user')}");
  //   Map<String, dynamic> json = jsonDecode(pref.getString('user')!);
  //   var user = UserModel.fromJson(json);
  //   currentUserId = user.id.toString();
  //   log(user.id.toString());
  //   log(user.name.toString());
  //   log(user.email.toString());
  //   log(user.phone.toString());
  //   log(user.pinCode.toString());
  // }

/*
CREATE TABLE curren_user (id INTEGER PRIMARY KEY,name TEXT,phone TEXT,email TEXT,pin_code TEXT);
*/
  // createCurrentUserDatabase() {
  //   openDatabase(
  //     "myDaftar.db",
  //     version: 1,
  //     onCreate: (db, version) async {
  //       await db
  //           .execute(
  //               "CREATE TABLE $currentUserTableName ($currentUserTableColumnId INTEGER PRIMARY KEY,$currentUserTableColumnName TEXT,$currentUserTableColumnPhone TEXT,$currentUserTableColumnEmail TEXT,$currentUserTableColumnPinCode TEXT)")
  //           .then((value) => log("Current User Database Successfully Created"))
  //           .onError((error, stackTrace) =>
  //               log("Database Error Creation ${error.toString()}"));
  //     },
  //     onOpen: (db) {
  //       getDataFromDB(db);
  //       log("Database Opened");
  //     },
  //   ).then((value) {
  //     database = value;
  //     emit(CreateUserDataBaseSuccessState());
  //   });
  // }

/*

INSERT INTO Table2
SELECT t1.*
FROM Table1 t1
WHERE NOT EXISTS 
(
      SELECT 1 
      FROM table2 t2 WHERE 
      t2.col1 = t1.col1 AND 
      t2.col2 = t1.col2
) 

*/
  // void initialUserInsert(String phoneNumber) async {
  //   await database!
  //       .transaction((txn) => txn
  //               .rawInsert(
  //                   "INSERT INTO $currentUserTableName ($currentUserTableColumnName ,$currentUserTableColumnPhone ,$currentUserTableColumnEmail ,$currentUserTableColumnPinCode) VALUES ('Abdo Barakat','$phoneNumber','abdobarakat.ab8@gmail.com','0000') ")
  //               .then((value) => {
  //                     log("value of insert :  $value"),
  //                     emit(InsertUserDataSuccessState())
  //                   })
  //               .catchError((error, stackTrace) {
  //             log("Error while inserting a Row Error :${error.toString()}");
  //           }))
  //       .then((value) {
  //     getDataFromDB(database!);
  //   });
  // }

  // void getDataFromDB(Database db) async {
  //   emit(GetUserDataBaseLoadingState());
  //   db.rawQuery("SELECT * FROM $currentUserTableName").then((value) {
  //     value.forEach((element) {
  //       log("==> ${element.toString()}");
  //     });
  //     emit(GetUserDataBaseSuccessState());
  //   });
  // }

  // void updateUserData() {
  //   database!.rawUpdate(
  //     "UPDATE $currentUserTableName SET $currentUserTableColumnPhone = ? WHERE id = ?",
  //     ['0100000000000000', 1],
  //   );
  // }
}


/*

CREATE TABLE Coll(
    id INTEGER PRIMARY KEY,
    name TEXT,
    start_date Text
);

CREATE TABLE Item (
    id INTEGER PRIMARY KEY,
    collection_id INTEGER,
    name TEXT,
    FOREIGN KEY (collection_id) REFERENCES Coll(id)
);
insert into Coll (id, name, start_date) values (3, 'marie', '5 nov');
insert into Item (id, name) values (5, 'marie');
select * from users;
select * from Item;


*/