import 'package:firebase_auth/firebase_auth.dart';

UserInfo userInfo =
    UserInfo.fromJson(// created userInfo object from UserInfo type
        {'Name': 'Günaydın'});

class UserInfoModel extends UserInfoEntity {
  // created UserInfoModel class which extends to UserInfoEntity
  UserInfoModel(
      {required super.email,
      required super.displayName,
      required super.phoneNumber,
      required super.uid});

  factory UserInfoModel.fromFireBaseUserInfo(UserInfo userInfo) {
    // created factory for using fromFireBaseUserInfo method to return UserInfoModel by calling UserInfo inside of the method
    return UserInfoModel(
      //TODO learn what is factory and named constructor why did we create this
      email: userInfo.email!,
      displayName: userInfo.displayName!,
      phoneNumber: userInfo.phoneNumber!,
      uid: userInfo.uid!,
    );
  }
}

class UserInfoEntity {
  // created Entity for declaring the variables of app as a rule
  UserInfoEntity(
      //TODO why did we create Entity
      {required this.email,
      required this.displayName,
      required this.phoneNumber,
      required this.uid});

  String email;
  String uid;
  String phoneNumber;
  String displayName;
}

abstract class UserRepository {
  // created repository for declaring methods of app as a rule
  Future<UserInfoEntity>
      getCurrentUser(); //TODO why this is abstract why do we create repositories  why do we use repositories
}

class UserRepositoryImpl extends UserRepository {
  // used Impl of repository for giving methods body and use DataSource in here to make it changable in the future
  //TODO understand abstract concept and concrete implementation then explain in detail with reasons of usage
  UserDataSource userDataSource =
      UserDataSourceImpl(); // we can change DataSourceImpl because all Impl of DataSources gonna be the same type

  @override
  Future<UserInfoEntity> getCurrentUser() async {
    // returning UserInfoEntity in Future because it still haven't created and using async because of that
    try {
      // try is working when no exception thrown and return userDataSource.getCurrentUser() because it has our UserInfoModel for returning UserInfoEntity because they are same type
      return userDataSource.getCurrentUser();
    } catch (e) {
      // catch is working when there is exception thrown and return userInfo by using UserInfoModel.fromFireBaseUserInfo(userInfo)
      return UserInfoModel.fromFireBaseUserInfo(userInfo);
    }
  }
}

abstract class Rohtolos {
  String meho();
  late String asd;
}

class Muho implements Rohtolos {
  @override
  String meho() {
    // TODO: implement muho
    throw UnimplementedError();
  }

  @override
  String asd = '1';
}

Muho muho = Muho();

abstract class UserDataSource {
  //TODO after learn abstraction and repositories
  // created abstract DataSource class for declaring the rule of getting data by getCurrentUser()
  Future<UserInfoModel> getCurrentUser(); // it returns Model because
}

class UserDataSourceImpl extends UserDataSource {
  @override
  Future<UserInfoModel> getCurrentUser() async {
    if (true) {
      return UserInfoModel.fromFireBaseUserInfo(userInfo);
    } else {
      throw Exception();
    }
  }
}
