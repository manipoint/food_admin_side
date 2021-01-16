import 'package:flutter/cupertino.dart';
import 'package:food_admin_side/Model/category_model.dart';
import 'package:food_admin_side/Model/orders_model.dart';
import 'package:food_admin_side/Model/product_model.dart';
import 'package:food_admin_side/Model/restaurant_model.dart';
import 'package:food_admin_side/Model/user.dart';
import 'package:food_admin_side/Services/cat_services.dart';
import 'package:food_admin_side/Services/order_services.dart';
import 'package:food_admin_side/Services/product_services.dart';
import 'package:food_admin_side/Services/resturent_services.dart';
import 'package:food_admin_side/Services/user_services.dart';
import 'package:intl/intl.dart';
import 'package:responsive_table/DatatableHeader.dart';

class TablesProvider with ChangeNotifier {
  List<DatatableHeader> userTableHeader = [
    DatatableHeader(
        text: "ID",
        value: "id",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Name",
        value: "name",
        show: true,
        flex: 2,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Email",
        value: "email",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
  ];
  List<DatatableHeader> orderTableHeader = [
    DatatableHeader(
        text: "ID",
        value: "id",
        show: false,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "User Id",
        value: "userId",
        show: true,
        flex: 2,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Description",
        value: "description",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Created At",
        value: "createdAt",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Total",
        value: "total",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
  ];
  List<DatatableHeader> productsTableHeader = [
    DatatableHeader(
        text: "ID",
        value: "id",
        show: false,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Name",
        value: "name",
        show: true,
        flex: 2,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Restaurant",
        value: "restaurant",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Category",
        value: "category",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Discont",
        value: "discont",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "OldPrice",
        value: "oldPrice",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "NewPrice",
        value: "newPrice",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
  ];
  List<DatatableHeader> resturantTableHeader = [
    DatatableHeader(
        text: "ID",
        value: "id",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Restaurant",
        value: "restaurant",
        show: true,
        flex: 2,
        sortable: true,
        textAlign: TextAlign.left),
  ];

  List<DatatableHeader> categoriesTableHeader = [
    DatatableHeader(
        text: "ID",
        value: "id",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Category",
        value: "category",
        show: true,
        flex: 2,
        sortable: true,
        textAlign: TextAlign.left),
  ];

  List<int> perPage = [5, 10, 15, 100];
  int total = 100;
  int currentPerPage;
  int currentPage = 1;
  bool isSearch = false;

  List<Map<String, dynamic>> userTableSource =
      List<Map<String, dynamic>>.empty(growable: true);
  List<Map<String, dynamic>> ordersTableSource = <Map<String, dynamic>>[];
  List<Map<String, dynamic>> productTableSource = <Map<String, dynamic>>[];
  List<Map<String, dynamic>> categoriesTableSource = <Map<String, dynamic>>[];
  List<Map<String, dynamic>> rastaurantTableSource = <Map<String, dynamic>>[];
  List<Map<String, dynamic>> selecteds = <Map<String, dynamic>>[];

  String slectedKey = "id";
  String sortColumn;
  bool sortAscending = true;
  bool isLoading = true;
  bool showSelect = true;

  UserServices _userServices = UserServices();
  List<UserModel> _users = <UserModel>[];
  List<UserModel> get users => _users;

  OrderServices _orderServices = OrderServices();
  List<OrderModel> _orders = <OrderModel>[];
  List<OrderModel> get orders => _orders;

  ProductServices _productServices = ProductServices();
  List<ProductModel> _products = <ProductModel>[];
  List<ProductModel> get products => _products;

  CategoryServices _categoryServices = CategoryServices();
  List<CategoriesModel> _categories = <CategoriesModel>[];

  RestaurantService _restaurantService = RestaurantService();
  List<RestaurantModel> _restaurant = <RestaurantModel>[];

  Future _loadFromFirebase() async {
    _users = await _userServices.getAllUsers();
    _orders = await _orderServices.getAllOrders();
    _products = await _productServices.getProducts();
    _categories = await _categoryServices.getAll();
    _restaurant = await _restaurantService.getAll();
  }

  List<Map<String, dynamic>> _getUsersData() {
    isLoading = true;
    notifyListeners();
    List<Map<String, dynamic>> temps = <Map<String, dynamic>>[];
    var i = _users.length;
    print(i);
    for (UserModel userData in _users) {
      temps.add({
        "id": userData.id,
        "email": userData.email,
        "name": userData.name,
      });
      i++;
    }
    isLoading = false;
    notifyListeners();
    return temps;
  }

  List<Map<String, dynamic>> _getProductsData() {
    List<Map<String, dynamic>> temps = <Map<String, dynamic>>[];
    for (ProductModel products in _products) {
      temps.add({
        "id": products.id,
        "name": products.name,
        "restaurant": products.restaurant,
        "category": products.catrgories,
        "discount": products.discout,
        "oldPrice": "Rs ${products.oldprice}",
        "newPrice": "Rs ${products.newprice}"
      });
    }
    return temps;
  }

  List<Map<String, dynamic>> _getOrdersData() {
    List<Map<String, dynamic>> temps = <Map<String, dynamic>>[];
    for (OrderModel orderModel in _orders) {
      temps.add({
        "id": orderModel.id,
        "userId": orderModel.userId,
        "description": orderModel.description,
        "createdAt": DateFormat.yMMMd()
            .format(DateTime.fromMillisecondsSinceEpoch(orderModel.createdAt)),
        "total": {"Rs ${orderModel.total}"},
      });
    }
    return temps;
  }

  List<Map<String, dynamic>> _getCategoryData() {
    List<Map<String, dynamic>> temps = <Map<String, dynamic>>[];
    for (CategoriesModel category in _categories) {
      temps.add({"id": category.id, "category": category.category});
    }
    return temps;
  }

  List<Map<String, dynamic>> _getRestaurantData() {
    List<Map<String, dynamic>> temps = <Map<String, dynamic>>[];
    for (RestaurantModel resturant in _restaurant) {
      temps.add({"id": resturant.id, "restaurant": resturant.restaurant});
    }
    return temps;
  }

  _initData() async {
    isLoading = true;
    notifyListeners();
    await _loadFromFirebase();
    userTableSource.addAll(_getUsersData());
    rastaurantTableSource.addAll(_getRestaurantData());
    productTableSource.addAll(_getProductsData());
    ordersTableSource.addAll(_getOrdersData());
    categoriesTableSource.addAll(_getCategoryData());
    isLoading = false;
    notifyListeners();
  }

  onSort(dynamic value) {
    sortColumn = value;
    sortAscending = !sortAscending;
    if (sortAscending) {
      userTableSource
          .sort((a, b) => b["$sortColumn"].compareTo(a["$sortColumn"]));
    } else {
      userTableSource
          .sort((a, b) => a["$sortColumn"].compareTo(b["$sortColumn"]));
    }
    notifyListeners();
  }

  onSelected(bool value, Map<String, dynamic> items) {
    print("$value $items");
    if (value) {
      selecteds.add(items);
    } else {
      selecteds.removeAt(selecteds.indexOf(items));
    }
    notifyListeners();
  }

  onSelectAll(bool value) {
    if (value) {
      selecteds = userTableSource.map((e) => e).toList().cast();
    } else {
      selecteds.clear();
    }
    notifyListeners();
  }

  onChange(int value) {
    currentPage = value;
    notifyListeners();
  }

  previous() {
    currentPage = currentPage >= 2 ? currentPage - 1 : 1;
    notifyListeners();
  }

  nextPage() {
    currentPage++;
    notifyListeners();
  }

  TablesProvider.init() {
    _initData();
  }
}
