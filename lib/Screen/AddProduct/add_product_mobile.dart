import 'dart:io' as file;
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
 

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  final priceController = TextEditingController();
  List<DocumentSnapshot> restaurant = <DocumentSnapshot>[];
  List<DocumentSnapshot> category = <DocumentSnapshot>[];

  List<DropdownMenuItem<String>> restaurantDropdown =
      <DropdownMenuItem<String>>[];
  List<DropdownMenuItem<String>> categoryDropdown =
      <DropdownMenuItem<String>>[];
  final imagePicker = ImagePicker();

  file.File _image;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: SingleChildScrollView(
            child: isLoading
                ? SizedBox(
                    height: 100,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: 30,
                        backgroundColor: Colors.blue,
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          //height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                              ),
                              color: white),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 4,
                              child: OutlineButton(
                                borderSide: BorderSide(
                                    color: Colors.grey.shade50, width: 2.5),
                                onPressed: () {
                                  _selectImage(imagePicker.getImage(
                                      source: ImageSource.gallery));
                                },
                                child: _displayChild(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0,left: 8),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                              ),
                              color: white),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: "Item Name",
                              border: InputBorder.none
                            ),
                            // ignore: missing_return
                            validator: (value){
                              if(value.isEmpty){
                                return "Item Name is Mandatory";
                              }else if(value.length>20){
                                return "Item name can not be more then 20 characters";
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0,left: 8),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                              ),
                              color: white),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: priceController,
                            decoration: InputDecoration(
                                hintText: "price",
                                border: InputBorder.none
                            ),
                            // ignore: missing_return
                            validator: (value){
                              if(value.isEmpty){
                                return "Item Price is Mandatory";
                              }else if(value.length>10){
                                return "Item name can not be more then 10 characters";
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  )),
      ),
    );
  }

  void _selectImage(Future<PickedFile> image) async {
    PickedFile tempImage = await image;
    setState(() => _image = file.File(tempImage.path));
  }

  _displayChild() {
    if (_image == null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.add_a_photo_outlined,
          color: Colors.grey,
          size: 80,
        ),
      );
    } else {
      return Image.file(
        _image,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }
}
