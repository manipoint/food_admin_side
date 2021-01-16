import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';
import 'package:food_admin_side/Helper/def_text.dart';
import 'package:food_admin_side/Services/product_services.dart';
import 'package:food_admin_side/Widgets/loading.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AddProductWeb extends StatefulWidget {
  @override
  _AddProductWebState createState() => _AddProductWebState();
}

class _AddProductWebState extends State<AddProductWeb> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController restaurantController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  final priceController = TextEditingController();
  ProductServices _productServices = ProductServices();
  Image addImage;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, size) => Scaffold(
          body: size.deviceScreenType == DeviceScreenType.desktop
              ? Container(
                  //color: green.withOpacity(.3),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: ExactAssetImage("images/bg.png"))),
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
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
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
                                                RegExp regex =
                                                    new RegExp(pattern);
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: TextFormField(
                                              controller: priceController,
                                              keyboardType:
                                                  TextInputType.number,
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
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: OutlineButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                onPressed: () {},
                                                child: addImage != null
                                                    ? addImage
                                                    : Icon(Icons
                                                        .add_a_photo_outlined),
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: TextFormField(
                                              keyboardType: TextInputType.text,
                                              controller: categoryController,
                                              autocorrect: true,
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                  hintText:
                                                      "eg fast, desi,...... ",
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
                                                height: 50,
                                                minWidth: 60,
                                                textColor: white,
                                                onPressed: () {
                                                  uploadProduct();
                                                },
                                                child: Text("Add Product"),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                color: green,
                                              ),
                                              SizedBox(
                                                width: 25,
                                              ),
                                              FlatButton(
                                                  height: 50,
                                                  textColor: white,
                                                  color: Colors.green,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  onPressed: () {
                                                    nameController.clear();
                                                    priceController.clear();
                                                    restaurantController
                                                        .clear();
                                                    categoryController.clear();
                                                  },
                                                  child: Text("Edit Product")),
                                              SizedBox(
                                                width: 25,
                                              ),
                                              FlatButton(
                                                  height: 50,
                                                  color: red,
                                                  textColor: white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  onPressed: () {},
                                                  child:
                                                      Text("Delete Product")),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
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
                )
              : null),
    );
  }

  void uploadProduct() async {
    if (formkey.currentState.validate()) {
      setState(() => isloading = true);
      _productServices.createProduct({
        "name": nameController.text,
        "new_price": double.parse(priceController.text),
        "Categories": categoryController.text,
        "restaurant": restaurantController.text,
        "picture": "",
      });
      formkey.currentState.reset();
      setState(() => isloading = false);

      // if (addImage != null) {
      //   List<int> encoded = utf8.encode(addImage.toString());
      //   Uint8List data = Uint8List.fromList(encoded);

      //   String imageUrl;
      //   final FirebaseStorage storage = FirebaseStorage.instance;
      //   final String picture =
      //       "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
      //   try {
      //     await storage.ref().child(picture).putData(data);
      //   } on FirebaseException catch (e) {
      //     print("error by Imran is ${e.message.toString()}");
      //   }

      //   imageUrl = await storage.ref(picture).getDownloadURL();
      //   print(imageUrl);
      // }
    } else {
      setState(() => isloading = false);
    }
  }
}
