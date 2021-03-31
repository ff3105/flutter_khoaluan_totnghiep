import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:khoaluan_totnghiep_mobile/src/utils/utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../utils/shared_pref.dart';
import '../../../resources/resources.dart';
import 'package:rxdart/rxdart.dart';
import '../../presentation.dart';

class UserTabViewModel extends BaseViewModel {
  final _user = BehaviorSubject<User>();

  User get user => _user.value;

  set user(User value) {
    _user.add(value);
    notifyListeners();
  }

  Future init() async {
    isLoading = true;

    user = SharedPref.getUser();

    isLoading = false;
  }

  Future logout() async {
    await SharedPref.clear();
    Phoenix.rebirth(context);
  }

  @override
  Future dispose() {
    _user.close();
    return super.dispose();
  }
}