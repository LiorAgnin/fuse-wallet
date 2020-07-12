import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ceu_do_mapia/models/app_state.dart';
import 'package:ceu_do_mapia/models/user_state.dart';
import 'package:ceu_do_mapia/redux/actions/user_actions.dart';
import 'package:redux/redux.dart';

class BackupViewModel extends Equatable {
  final UserState user;
  final bool isProMode;
  final Function(VoidCallback successCb) backupWallet;

  BackupViewModel({this.user, this.backupWallet, this.isProMode});

  static BackupViewModel fromStore(Store<AppState> store) {
    return BackupViewModel(
        isProMode: store.state.userState.isProMode ?? false,
        user: store.state.userState,
        backupWallet: (successCb) {
          store.dispatch(backupWalletCall(successCb));
        });
  }

  @override
  List<Object> get props => [user, isProMode];
}
