import 'dart:io' as file;
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_admin_side/Services/cat_services.dart';
import 'package:food_admin_side/Services/product_services.dart';
import 'package:food_admin_side/Services/resturent_services.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  Category _categoryServices = Category();
  Restaurant _restaurantServices = Restaurant();
  ProductServices _productServices = ProductServices();

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
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 4,
                            child: OutlineButton(
                                borderSide: BorderSide(
                                    color: Colors.lightGreen.withOpacity(.3),
                                    width: 2.5),
                                onPressed: () {
                                  _selectImage(imagePicker.getImage(
                                      source: ImageSource.gallery));
                                },
                            child: _displayChild(),),

                          ),
                        ),
                      )
                    ],
                  )),
      ),
    );
  }

  void _selectImage(Future<PickedFile> image) async {
    PickedFile tempImage = await image;
    setState(() => _image = file.File(tempImage.path));
  }
  _displayChild(){
    if(_image == null){
      Icon(Icons.add_a_photo_outlined,color: Colors.lightGreen.shade300,);
    }else{
      return Image.file(_image,fit: BoxFit.fill,width: double.infinity,);
    }
  }
}
