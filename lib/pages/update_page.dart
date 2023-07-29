import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/update_controller.dart';
import '../model/post_model.dart';

class UpdatePage extends StatefulWidget {
  static final String id = 'update_page';

  Post post;
  UpdatePage({required this.post, Key? key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final _controller = Get.put(UpdateController());

  @override
  void initState() {
    super.initState();

    _controller.titleTextEditingController().text = widget.post.title!;
    _controller.bodyTextEditingController().text = widget.post.body!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update post'),
      ),
      body: Obx(
            () => Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Title
                    Container(
                      height: 100,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      child: Center(
                        child: TextField(
                          controller: _controller.titleTextEditingController(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          decoration: InputDecoration(
                            labelText: 'Title',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),

                    // Body
                    Container(
                      height: 300,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      child: TextField(
                        controller: _controller.bodyTextEditingController(),
                        style: TextStyle(fontSize: 18),
                        maxLines: 30,
                        decoration: InputDecoration(
                          labelText: 'Body',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    // FlatButton(
                    //   color: Colors.blue,
                    //   onPressed: () {
                    //     _controller.apiPostUpdate(context, widget.post);
                    //   },
                    //   child: Text("update"),
                    // ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueAccent),
                      width: 160,
                      height: 100,
                      child: TextButton(
                        onPressed: (){
                          _controller.apiPostUpdate(context, widget.post);
                          },
                        child: const Text(
                          "Update",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            _controller.isLoading() ? Center(child: CircularProgressIndicator(),) : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}