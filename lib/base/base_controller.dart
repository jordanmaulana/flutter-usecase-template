import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseListController extends GetxController {
  /// Indicates the API request is on loading
  bool loading = false;

  /// Indicates current page in paginated API
  int page = 1;
  bool hasNext = false;

  /// Indicates error message to be shown in UI
  String error = '';

  /// Marked as Future<void> to be able to be used on [RefreshIndicator] widget.
  /// To be called when user drags down the list from top of the list.
  Future<void> resetPage() async {
    page = 1;
    hasNext = false;
    error = '';
    getData();
  }

  /// To be called when user scroll the list to the max.
  void nextPage() {
    if (!hasNext || loading) return;
    page++;
    getData();
  }

  /// Set loading state
  void setLoading(bool value) {
    loading = value;
    if (loading) error = '';
    update();
  }

  @protected
  void getData() {}
}

class BaseDetailController extends GetxController {
  bool loading = false;
  String error = '';

  void setLoading(bool value) {
    loading = value;
    if (loading) error = '';
    update();
  }

  @protected
  void getData() {}
}
