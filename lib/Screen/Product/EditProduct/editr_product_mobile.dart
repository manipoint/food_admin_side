import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';
import 'package:food_admin_side/Helper/def_text.dart';
import 'package:food_admin_side/Widgets/loading.dart';

class EditProduct extends StatefulWidget {
  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isloading = false;
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
                                      onPressed: () {},
                                      // child: _displayChild(),
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
                                    // controller: restaurantController,
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
                                      onPressed: () {},
                                      child: Text("Add Product"),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: green,
                                    ),
                                    SizedBox(width: 20,),
                                     FlatButton(
                                      height: 40,
                                      //minWidth: 50,
                                      textColor: white,
                                      onPressed: () {},
                                      child: Text("Delete Product"),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: green,
                                    ),
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
}
