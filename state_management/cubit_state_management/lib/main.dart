import 'package:flutter/material.dart';

import 'package:cubit_state_management/business_logic_layer/cart_cubit/cart.dart';
import 'package:cubit_state_management/business_logic_layer/catalog_cubit/catalog.dart';
import 'package:cubit_state_management/business_logic_layer/order_cubit/order.dart';
import 'package:cubit_state_management/business_logic_layer/search_cubit/search.dart';

import 'package:cubit_state_management/data_layer/data_source/products_data_source.dart';
import 'package:cubit_state_management/data_layer/repository/products_repository_implementation.dart';

import 'package:cubit_state_management/presentation_layer/cart/cart_page.dart';
import 'package:cubit_state_management/presentation_layer/catalog/catalog_page.dart';
import 'package:cubit_state_management/presentation_layer/orders/orders_page.dart';
import 'package:cubit_state_management/presentation_layer/utils/app_colors.dart';
import 'package:cubit_state_management/presentation_layer/utils/app_icons.dart';
import 'package:cubit_state_management/presentation_layer/utils/app_strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final catalogCubit = CatalogCubit(
      productsRepository: ProductsRepositoryImplementation(
        productsDataSource: ProductsDataSource(),
      ),
    );

    final searchCubit = SearchBloc(
      productsRepository: ProductsRepositoryImplementation(
        productsDataSource: ProductsDataSource(),
      ),
    );

    final cartCubit = CartCubit();

    final orderBloc = OrderCubit();

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.secondaryPink,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.primaryPink,
          elevation: 0.0,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w900),
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
        ),
      ),
      home: MyHomePage(
        catalogCubit: catalogCubit,
        searchCubit: searchCubit,
        cartCubit: cartCubit,
        orderCubit: orderBloc,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final CatalogCubit catalogCubit;
  final SearchBloc searchCubit;
  final CartCubit cartCubit;
  final OrderCubit orderCubit;

  const MyHomePage({
    required this.catalogCubit,
    required this.searchCubit,
    required this.cartCubit,
    required this.orderCubit,
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    widget.catalogCubit.loadCatalog();

    super.initState();
  }

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = <Widget>[
      OrdersPage(orderCubit: widget.orderCubit),
      CatalogPage(
        catalogCubit: widget.catalogCubit,
        searchCubit: widget.searchCubit,
        cartCubit: widget.cartCubit,
      ),
      CartPage(
        cartCubit: widget.cartCubit,
        orderBloc: widget.orderCubit,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.primaryPink,
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: AppIcon(path: AppIconPath.orderIcon),
            label: AppString.orders,
          ),
          BottomNavigationBarItem(
            icon: AppIcon(path: AppIconPath.catalogIcon),
            label: AppString.catalog,
          ),
          BottomNavigationBarItem(
            icon: AppIcon(path: AppIconPath.cartIcon),
            label: AppString.cart,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void dispose() {
    widget.catalogCubit.dispose();
    widget.searchCubit.dispose();
    widget.cartCubit.dispose();
    widget.orderCubit.dispose();

    super.dispose();
  }
}
