import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Todo part one
class ItemModel {
  String name;
  double price;

  ItemModel({required this.name, required this.price});
}

class CartClass extends StatefulWidget {
  const CartClass({Key? key}) : super(key: key);

  @override
  State<CartClass> createState() => _CartClassState();
}

class _CartClassState extends State<CartClass> {
  List<ItemModel> menuItems = []; // Rename 'mentItems' to 'menuItems'

  void prepareMenu() {
    menuItems.add(ItemModel(name: "Egg", price: 30));
    menuItems.add(ItemModel(name: "Milk", price: 10));
    menuItems.add(ItemModel(name: "Bread", price: 40));
    menuItems.add(ItemModel(name: "Chicken", price: 18));
    menuItems.add(ItemModel(name: "Cheese", price: 90));
    menuItems.add(ItemModel(name: "Tomatoes", price: 100));
    menuItems.add(ItemModel(name: "Onions", price: 135));
  }

  late CartProvider cartProvider;

  @override
  void initState() {
    prepareMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Text Screen'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => CartProvider()),
              // );
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Consumer<CartProvider>( // Use the correct type for Consumer
        builder: (context, data, child) {
          return ListView.builder(
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    menuItems[index].name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '\$' + menuItems[index].price.toString(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      cartProvider.addToCart(menuItems[index]);
                    },
                    icon: Icon(Icons.add),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CartProvider extends ChangeNotifier {
  List<ItemModel> myCartItems = [];
  double cartValue = 0;

  addToCart(ItemModel itemModel) {
    myCartItems.add(itemModel);
    cartValue += itemModel.price;
    notifyListeners();
    print('Adding To Cart');
  }
}
