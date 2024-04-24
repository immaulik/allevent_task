import 'package:allevents/api/api_future.dart';
import 'package:allevents/const/asset_const.dart';
import 'package:allevents/const/color_const.dart';
import 'package:allevents/models/event_model.dart';
import 'package:allevents/modules/main_screen/main_screen_controller.dart';
import 'package:allevents/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        titleSpacing: 0,
        title: _searchField(),
      ),
      drawer: Drawer(
        child: SafeArea(
            child: Column(
          children: [
            ListTile(
              title: Text(
                "Logout",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              onTap: () => controller.onLogout(),
            ),
          ],
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 18, left: 18, top: 10),
        child: Column(
          children: [
            _filterTile(),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ApiFuture(
                rxValue: controller.rxApiCategoryList,
                widget: _tile,
                onRetryTap: controller.onApiRetryTap,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tile() {
    return controller.isGridView.isTrue
        ? _categoryListView()
        : _categoryGridView();
  }

  Widget _categoryListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.filteredList.length,
      itemBuilder: (context, index) {
        EventModel model = controller.filteredList[index];
        return Padding(
          padding: EdgeInsets.only(top: 10),
          child: InkWell(
            onTap: () => controller.onEventTap(model),
            borderRadius: BorderRadius.circular(15),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: ColorConst.white,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: NetworkImageWidget(
                      imgUrl: model.thumbUrlLarge,
                      height: 120,
                      width: 120,
                      boxFit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.eventName,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          DateFormat('dd MMM, yyyy').format(model.startTime),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                        Text(
                          model.location,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _categoryGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (Get.width / 6) / 102,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      shrinkWrap: true,
      itemCount: controller.filteredList.length,
      itemBuilder: (context, index) {
        EventModel model = controller.filteredList[index];
        return InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () => controller.onEventTap(model),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: ColorConst.white,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: NetworkImageWidget(
                    imgUrl: model.thumbUrlLarge,
                    height: 150,
                    width: Get.width,
                    boxFit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.eventName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        DateFormat('dd MMM, yyyy').format(model.startTime),
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      Text(
                        model.location,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _searchField() {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: TextField(
        onChanged: (value) => controller.onSearch(value),
        style: TextStyle(
            fontSize: 14, color: Colors.black45, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            borderSide: BorderSide(width: 1, color: Colors.transparent),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          filled: true,
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
          fillColor: ColorConst.surface,
          hintText: "Search..",
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
            size: 20,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(width: 1, color: Colors.transparent),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(width: 1, color: Colors.transparent),
          ),
        ),
      ),
    );
  }

  Widget _filterTile() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: ColorConst.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            hoverColor: Colors.red,
            onTap: () => controller.onTapCategory(),
            child: Obx(
              () => Row(
                children: [
                  SvgPicture.asset(
                    AssetConst.incognitoIcon,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                        controller.isCategorySelected.isTrue
                            ? ColorConst.primary
                            : Colors.black45,
                        BlendMode.srcIn),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Category",
                    style: TextStyle(
                        color: controller.isCategorySelected.isTrue
                            ? ColorConst.primary
                            : Colors.black45,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => controller.onChangeGridView(),
            child: Obx(
              () => Container(
                width: 50,
                padding: EdgeInsets.symmetric(horizontal: 5),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorConst.primary.withOpacity(0.5)),
                child: Row(
                  children: [
                    Icon(
                      controller.isGridView.isTrue
                          ? Icons.grid_view
                          : Icons.format_list_bulleted_rounded,
                      size: 14,
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      controller.isGridView.isTrue ? "Grid" : "List",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryListBottomSheet extends GetView<MainScreenController> {
  const CategoryListBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(),
                  flex: 1,
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.back();
                            controller.isCategorySelected(false);
                          },
                          icon: Icon(
                            Icons.close,
                            size: 15,
                          )),
                    ],
                  ),
                )
              ],
            ),
            Text(
              "Categories",
              style: Get.textTheme.displayMedium!.copyWith(
                  color: ColorConst.lightBlack,
                  fontWeight: FontWeight.w900,
                  fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => _categoryTile(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryTile() {
    return Wrap(
      children: [
        for (var item in controller.categoryList)
          InkWell(
            onTap: () {
              controller.changeCategory(item);
            },
            child: Container(
                margin: EdgeInsets.only(right: 5, bottom: 10),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                decoration: BoxDecoration(
                    color: controller.selectedCategory.value.category ==
                            item.category
                        ? ColorConst.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: controller.selectedCategory.value.category ==
                                item.category
                            ? Colors.transparent
                            : Colors.grey,
                        width: 1)),
                child: Text(
                  item.category,
                  style: Get.textTheme.displayMedium!.copyWith(
                      color: controller.selectedCategory.value.category ==
                              item.category
                          ? Colors.white
                          : Colors.grey,
                      fontWeight: FontWeight.w500),
                )),
          ),
      ],
    );
  }
}
