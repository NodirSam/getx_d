import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/create_controller.dart';

class CreatePage extends StatefulWidget {
  static final String id = 'create_page';

  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _controller = Get.put(CreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create post'),
        centerTitle: true,
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
                    //     _controller.apiPostCreate(context);
                    //   },
                    //   child: Text("create"),
                    // ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueAccent),
                      width: 160,
                      height: 100,
                      child: TextButton(
                        onPressed: (){
                          _controller.apiPostCreate(context);
                        },
                        child: const Text(
                          "create",
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