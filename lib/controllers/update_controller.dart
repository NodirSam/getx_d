import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import '../model/post_model.dart';
import '../services/http_service.dart';
import 'home_controller.dart';

class UpdateController extends GetxController {
  var isLoading = false.obs;
  var titleTextEditingController = TextEditingController().obs;
  var bodyTextEditingController = TextEditingController().obs;
  final _homeController = Get.put(HomeController());

  apiPostUpdate(BuildContext context, Post post) async {
    isLoading(true);

    var response = await Network.PUT(Network.BASE + Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(Post(userId: post.userId, id: post.id, title: titleTextEditingController().text, body: bodyTextEditingController().text)));

    if (response != null) {
      Navigator.of(context).pop();
      _homeController.apiPostList();
    }

    isLoading(false);
  }
}