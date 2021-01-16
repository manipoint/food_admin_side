import 'dart:io' as file;
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';
import 'package:food_admin_side/Helper/def_text.dart';
import 'package:food_admin_side/Services/navigation_sevice.dart';
import 'package:food_admin_side/Services/product_services.dart';
import 'package:food_admin_side/Widgets/loading.dart';
import 'package:food_admin_side/locator.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController restaurantController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  final priceController = TextEditingController();
  TextEditingController idController = TextEditingController();

  //String  get id=>idController.text;


  ProductServices _productServices = ProductServices();
  bool isloading = false;
  final imagePicker = ImagePicker();

  file.File _image;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //color: green.withOpacity(.3),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: ExactAssetImage("images/bg.png"))),
        child: Form(
          key: formkey,
          child: isloading
              ? Loading()
              : Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        FittedBox(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 12,
                                ),
                                MyText(
                                  text: "Product Id",
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                MyText(
                                  text:
                                      "First two letter of your resturent then category prduct name ",
                                  size: 10,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width / 1.6,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextFormField(
                                    controller: idController,
                                    autocorrect: true,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "eg MCCHKburgger-1"),
                                    validator: (name) {
                                      Pattern pattern =
                                          r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
                                      RegExp regex = new RegExp(pattern);
                                      if (!regex.hasMatch(name))
                                        return 'Invalid Product Name';
                                      else
                                        return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                MyText(
                                  text: "Product Name",
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width / 1.6,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextFormField(
                                    controller: nameController,
                                    autocorrect: true,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            "eg Pizza , Mutton karahi...."),
                                    validator: (name) {
                                      Pattern pattern =
                                          r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
                                      RegExp regex = new RegExp(pattern);
                                      if (!regex.hasMatch(name))
                                        return 'Invalid Product Name';
                                      else
                                        return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                MyText(
                                  text: "Product Price",
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width / 1.6,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextFormField(
                                    controller: priceController,
                                    keyboardType: TextInputType.number,
                                    autocorrect: true,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        hintText: "eg 7000",
                                        border: InputBorder.none),
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                MyText(
                                  text: "Add Image",
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  width:
                                      MediaQuery.of(context).size.width / 1.7,
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: OutlineButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      onPressed: () {
                                        _selectImage(imagePicker.getImage(
                                            source: ImageSource.gallery));
                                      },
                                      child: _displayChild(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                MyText(
                                  text: "Resturent Name",
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width / 1.7,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextFormField(
                                    controller: restaurantController,
                                    autocorrect: true,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                MyText(
                                  text: "Category",
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width / 1.7,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: categoryController,
                                    autocorrect: true,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        hintText: "eg fast, desi,...... ",
                                        border: InputBorder.none),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FlatButton(
                                      height: 40,
                                      //minWidth: 50,
                                      textColor: white,
                                      onPressed: () {
                                        _addProduct();
                                        nameController.clear();
                                        priceController.clear();
                                        restaurantController.clear();
                                        categoryController.clear();
                                      },
                                      child: Text("Add Product"),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: green,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    FlatButton(
                                        height: 40,
                                        textColor: white,
                                        color: Colors.green,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        onPressed: () {
                                          locator<NavigationService>()
                                              .navigateTo("edit");
                                          nameController.clear();
                                          priceController.clear();
                                          restaurantController.clear();
                                          categoryController.clear();
                                        },
                                        child: Text("Edit Product")),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    FlatButton(
                                        height: 40,
                                        color: red,
                                        textColor: white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        onPressed: () {
                                          locator<NavigationService>()
                                              .navigateTo("delete");
                                        },
                                        child: Text("Delete Product")),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
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

  void _addProduct() async {
    if (formkey.currentState.validate()) {
      setState(() => isLoading = true);
      if (_image != null) {
        String imageUrl;
        final FirebaseStorage storage = FirebaseStorage.instance;

        final String imageName =
            "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
        try {
          UploadTask task = storage.ref().child(imageName).putFile(_image);
          TaskSnapshot snapshot = await task.then((value) => value);
          task.then((val) async {
            imageUrl = await snapshot.ref.getDownloadURL();
            _productServices.createProduct({
              "name": nameController.text,
              "new_price": priceController.text,
              "Categories": categoryController.text,
              "restaurant": restaurantController.text,
              "picture": imageUrl,
            });
          });
        } on FirebaseException catch (e) {
          print(e.toString());
          print("Unable toupload pic");
        }
      }
    }
  }
}
