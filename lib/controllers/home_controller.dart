import 'package:get/get.dart';
import '../model/post_model.dart';
import '../services/http_service.dart';

class HomeController extends GetxController {
  RxList<Post> items = <Post>[].obs;
  var isLoading = false.obs;

  Future apiPostList() async {
    isLoading(true);

    var response = await Network.GET(Network.BASE + Network.API_LIST);

    if (response != null) {
      items(Network.parsePostList(response));
    }

    isLoading(false);
  }

  Future<bool> apiPostDelete(Post post) async {
    isLoading(true);

    var response = await Network.DEL(Network.BASE + Network.API_DELETE + post.id.toString());

    isLoading(false);

    return response != null;
  }
}