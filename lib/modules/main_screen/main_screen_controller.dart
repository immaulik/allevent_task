import 'package:allevents/api/api_config.dart';
import 'package:allevents/api/api_const.dart';
import 'package:allevents/api/enums.dart';
import 'package:allevents/api/response_model.dart';
import 'package:allevents/models/category_model.dart';
import 'package:allevents/models/event_model.dart';
import 'package:allevents/models/event_response_model.dart';
import 'package:allevents/modules/main_screen/main_screen.dart';
import 'package:allevents/routes/pages.dart';
import 'package:allevents/utils/custom_snakbar.dart';
import 'package:allevents/utils/enum.dart';
import 'package:allevents/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  RxBool isCategorySelected = false.obs;
  RxBool isGridView = false.obs;
  RxBool isSearch = false.obs;
  RxList<CategoryModel> categoryList = RxList();
  RxList<EventModel> eventList = RxList();
  RxList<EventModel> searchEventList = RxList();

  RxList<EventModel> get filteredList =>
      isSearch.isTrue ? searchEventList : eventList;
  Rx<CategoryModel> selectedCategory = Rx(CategoryModel());
  Rx<EventResponseModel> eventResponseModel = Rx(EventResponseModel());
  Rx<ResponseModel> rxApiCategoryList = Rx(ResponseModel.loading());

  @override
  void onInit() {
    _getCategories();
    rxApiCategoryList.listen((p0) {
      logger.w("fdsfmsfkldms = ${p0.apiStatus}");
    });
    super.onInit();
  }

  void onTapCategory() {
    isCategorySelected(!isCategorySelected.value);
    Get.bottomSheet(CategoryListBottomSheet(), isDismissible: false);
  }

  Future<void> changeCategory(CategoryModel model) async {
    selectedCategory(model);
    rxApiCategoryList.value = ResponseModel.loading();
    isCategorySelected(!isCategorySelected.value);
    Get.back();
    await _getCategoryList();
  }

  Future<void> _getCategories() async {
    try {
      ResponseModel model = await ApiConfig.client.getData(ApiConst.categories);
      if (model.apiStatus == ApiStatus.success) {
        List<dynamic> category = model.data;
        categoryList.value =
            category.map((e) => CategoryModel.fromJson(e)).toList();
        selectedCategory(categoryList.first);
        await _getCategoryList();
      }
    } on Exception catch (e) {
      logger.e(e.toString());
    }
  }

  Future<void> _getCategoryList() async {
    try {
      ResponseModel model =
          await ApiConfig.client.getData(selectedCategory.value.data);
      if (model.apiStatus == ApiStatus.success) {
        eventResponseModel.value = EventResponseModel.fromJson(model.data);
        eventList.value = eventResponseModel.value.events;
      }
      rxApiCategoryList.value = model;
    } on Exception catch (e) {
      logger.e(e.toString());
      rxApiCategoryList.value = ResponseModel.error(message: e.toString());
    }
  }

  Future<void> onApiRetryTap() async {
    await _getCategoryList();
  }

  void onEventTap(EventModel model) {
    Get.toNamed(Pages.eventDetail, arguments: model);
  }

  void onChangeGridView() {
    isGridView(!isGridView.value);
  }

  void onSearch(String value) {
    if (value.isNotEmpty) {
      isSearch(true);
      searchEventList.value = eventList
          .where((p0) => p0.eventName.toLowerCase().contains(value))
          .toList();
    } else {
      isSearch(false);
    }
  }

  Future<void> onLogout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Pages.login);
    showSnackBar(
        title: "Logout",
        subTitle: "Logout Successfully",
        type: SnackBarType.general);
  }
}
