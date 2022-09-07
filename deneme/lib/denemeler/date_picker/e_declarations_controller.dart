import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class EDeclarationsController extends Controller {
  bool isVisibilityStartDate = false;
  bool isVisibilityEndDate = false;
  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  void isVisibilityStartDateCheck(bool value) {
    isVisibilityStartDate = value;
    refreshUI();
  }

  void isVisibilityEndDateCheck(bool value) {
    isVisibilityEndDate = value;
    refreshUI();
  }
}
