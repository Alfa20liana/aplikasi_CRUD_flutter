import 'package:flutter/material.dart';
import 'package:tugas_besar_1/bahan.dart';

class Product {
  String name;
  double price;

  Product({required this.name, required this.price});
}

class Product_view extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product_view> {
  List<Product> products = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 5, 78),
       appBar: AppBar(
        title: Text('Tampilan Produk'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Daftar Barang',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Card(
                    child: ListTile(
                      title: Text(
                        'Produk : ${products[index].name}',
                        style: secondTextStyle,
                      ),
                      subtitle: Text(
                        'Harga : Rp ${products[index].price.toString()}',
                        style: secondTextStyle,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            color: Color.fromARGB(255, 242, 184, 27),
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _showEditDialog(index);
                            },
                          ),
                          IconButton(
                            color: Color.fromARGB(255, 242, 184, 27),
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deleteProduct(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 213,
        height: 50,
        child: FloatingActionButton.extended(
          onPressed: () {
            _showAddDialog();
          },
          backgroundColor: Color.fromARGB(225, 242, 184, 27),
          label: Text('Tambah Barang'),
          icon: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 242, 184, 27),
          title: Text('Tambah Produk'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: TextColor,
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Nama Produk",
                    hintStyle: secondTextStyle.copyWith(
                      fontSize: 12,
                      color: secondTextColor.withOpacity(0.6),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: TextColor,
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: priceController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                    hintText: "Harga Barang",
                    hintStyle: secondTextStyle.copyWith(
                      fontSize: 12,
                      color: secondTextColor.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                _addProduct();
                Navigator.pop(context);
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(int index) {
    nameController.text = products[index].name;
    priceController.text = products[index].price.toString();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 242, 184, 27),
          title: Text('Edit Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                       Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: TextColor,
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Nama Produk",
                    hintStyle: secondTextStyle.copyWith(
                      fontSize: 12,
                      color: secondTextColor.withOpacity(0.6),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: TextColor,
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: priceController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                    hintText: "Harga Barang",
                    hintStyle: secondTextStyle.copyWith(
                      fontSize: 12,
                      color: secondTextColor.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _updateProduct(index);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _addProduct() {
    String name = nameController.text;
    double price = double.parse(priceController.text);

    setState(() {
      products.add(Product(name: name, price: price));
    });
  }

  void _updateProduct(int index) {
    String name = nameController.text;
    double price = double.parse(priceController.text);

    setState(() {
      products[index].name = name;
      products[index].price = price;
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }
}
