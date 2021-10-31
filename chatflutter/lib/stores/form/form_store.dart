import 'package:boilerplate/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';
import 'dart:convert';
import 'package:validators/validators.dart';
import 'package:boilerplate/models/user/User.dart';
import 'package:boilerplate/models/user/User_Response.dart';
import '../../data/repository.dart';

part 'form_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // repository instance
  final Repository _repository;

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  bool isLoggedIn = false;

  // constructor:---------------------------------------------------------------
  _FormStore(Repository repository) : this._repository = repository {
    // setting up disposers
    _setupValidations();

    // checking if user is logged in
    repository.isLoggedIn.then((value) {
      this.isLoggedIn = value;
    });
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => userEmail, validateUserEmail),
      reaction((_) => password, validatePassword),
      reaction((_) => confirmPassword, validateConfirmPassword)
    ];
  }

  // store variables:-----------------------------------------------------------

  @observable
  String userEmail = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  bool success = false;

  @observable
  bool loading = false;

  @observable
  User? userInfo;

  @computed
  bool get canLogin =>
      !formErrorStore.hasErrorsInLogin &&
      userEmail.isNotEmpty &&
      password.isNotEmpty;

  @computed
  bool get canRegister =>
      !formErrorStore.hasErrorsInRegister &&
      userEmail.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty;

  @computed
  bool get canForgetPassword =>
      !formErrorStore.hasErrorInForgotPassword && userEmail.isNotEmpty;

  // actions:-------------------------------------------------------------------
  @action
  void setUserId(String value) {
    userEmail = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  @action
  void validateUserEmail(String value) {
    if (value.isEmpty) {
      formErrorStore.userEmail = "Email can't be empty";
    } /* else if (!isEmail(value)) {
      formErrorStore.userEmail = 'Please enter a valid email address';
    }  */
    else {
      formErrorStore.userEmail = null;
    }
  }

  @action
  void validatePassword(String value) {
    if (value.isEmpty) {
      formErrorStore.password = "Password can't be empty";
    } else if (value.length < 6) {
      formErrorStore.password = "Password must be at-least 6 characters long";
    } else {
      formErrorStore.password = null;
    }
  }

  @action
  void validateConfirmPassword(String value) {
    if (value.isEmpty) {
      formErrorStore.confirmPassword = "Confirm password can't be empty";
    } else if (value != password) {
      formErrorStore.confirmPassword = "Password doen't match";
    } else {
      formErrorStore.confirmPassword = null;
    }
  }

  @action
  Future register() async {
    loading = true;
  }

  @action
  Future login() async {
    loading = true;
    final future = _repository.login(this.userEmail, this.password);
    await future.then((value) async {
      if (value['code'] == 0) {
        var data = value['data'];
        this.userInfo = User.fromJson(data['user']);
        _repository.saveIsLoggedIn(true);
        this.isLoggedIn = true;
        this.success = true;
      } else {
        print('failed to login');
      }
      loading = false;
    }).catchError((e) {
      loading = false;
      print(e);
      this.isLoggedIn = false;
      this.success = false;
      throw e;
    });
  }

  @action
  Future forgotPassword() async {
    loading = true;
  }

  @action
  Future logout() async {
    print('logout');
    Future.delayed(Duration(milliseconds: 0), () {
      _repository.saveIsLoggedIn(false);
      this.isLoggedIn = false;
    });
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validatePassword(password);
    validateUserEmail(userEmail);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {
  @observable
  String? userEmail;

  @observable
  String? password;

  @observable
  String? confirmPassword;

  @computed
  bool get hasErrorsInLogin => userEmail != null || password != null;

  @computed
  bool get hasErrorsInRegister =>
      userEmail != null || password != null || confirmPassword != null;

  @computed
  bool get hasErrorInForgotPassword => userEmail != null;
}
