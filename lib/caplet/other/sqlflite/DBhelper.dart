import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
class DBhelpler{
  static Database? _db;
  Future<Database?> get db async{
    if(_db!=null)
      return _db;
    else
      return _db=await initDatabase();
  }
  initDatabase()async{
    return await openDatabase(
      join(await getDatabasesPath(), 'caplit.db'),
      version: 1,
      onCreate:   (db, version) {
      db.execute(
        'CREATE TABLE Cart(id INTEGER PRIMARY KEY, title TEXT, image Text,price TEXT,discount TEXT,description TEXT,size TEXT,qtr INTEGER)',
      );
      db.execute(
        'CREATE TABLE OrderH(id INTEGER PRIMARY KEY,total INTEGER)',
      );
      db.execute(
        'CREATE TABLE product(pNo INTEGER PRIMARY KEY,id INTEGER, title TEXT, image Text,price TEXT,discount TEXT,description TEXT,size TEXT,qtr INTEGER,orderid INTEGER,FOREIGN KEY(orderid) REFERENCES OrderH(id))',
      );
     },
    );
  }
  Future<product> insertproduct(product product)async{
    var dbclint=await db;
    await dbclint!.insert("product", product.toMap());
    return product;
  }
  Future<order> insertorder(order order)async{
    var dbclint=await db;
    await dbclint!.insert("OrderH", order.toMap());
    return order;
  }
  Future<cart> insertcart(cart cart)async{
    var dbclint=await db;
    await dbclint!.insert("Cart",cart.toMap());
    return cart;
  }
  Future<void> clean()async{
    var dbclint=await db;
    await dbclint!.execute("delete from Cart");
    // await dbclint!.rawQuery("TRUNCATE TABLE Cart");
  }
  Future<List<cart>> getCartData() async {
    // Get a reference to the database.
    var dbclint = await db;
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await dbclint!.query('Cart');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return cart(
        id: maps[i]['id'],
        title: maps[i]['title'],
        image: maps[i]['image'],
        price: maps[i]['price'],
        discount: maps[i]['discount'],
        description: maps[i]['description'],
        size: maps[i]['size'],
        qtr: maps[i]['qtr'],
      );
    });
  }
  Future<List<order>> getorderData() async {
    // Get a reference to the database.
    var dbclint = await db;
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await dbclint!.query('OrderH');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return order(
       total: maps[i]['total'],
       id: maps[i]['id']
      );
    });
  }
  Future<List<product>> getproductData(int id) async {
    // Get a reference to the database.
    var dbclint = await db;
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await dbclint!.query('product',
      where: 'orderid = ?',
      whereArgs: [id],
    );

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return product(
        id: maps[i]['id'],
        title: maps[i]['title'],
        image: maps[i]['image'],
        price: maps[i]['price'],
        discount: maps[i]['discount'],
        description: maps[i]['description'],
        size: maps[i]['size'],
        qtr: maps[i]['qtr'],
        orderId: maps[i]['orderId'],
      );
    });
  }
  Future<void> deletecart(int? id) async {
    // Get a reference to the database.
    final dbclint = await db;

    // Remove the Dog from the database.
    await dbclint!.delete(
      'cart',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
  Future<void> updatecart(cart cart) async {
    // Get a reference to the database.
    final dbclint = await db;

    // Update the given Dog.
    await dbclint!.update(
      'cart',
      cart.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [cart.id],
    );
  }
}
class order {
  final int id;
  final int total;

  const order({
    required this.total, this.id=0,
  });
  Map<String, dynamic> toMap()     {
    return {
      'total': total,
    };
  }

  @override
  String toString() {
    return 'order{total: $total}';
  }
}
class cart{
  int? id;
  String? title;
  String? image;
  String? price;
  String? discount;
  String? description;
  String? size;
  int? qtr;
  cart({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.discount,
    required this.description,
    required this.size,
    required this.qtr,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'price': price,
      'discount': discount,
      'description': description,
      'size': size,
      'qtr':qtr
    };
  }
  cart.fromMap(){

  }
  String toString() {
    return 'Dog{id: $id, title: $title, image: $image,price: $price, discount: $discount, description: $description,qtr:$qtr}';
  }

}
class product{
  int? id;
  String? title;
  String? image;
  String? price;
  String? discount;
  String? description;
  String? size;
  int? qtr;
  int? orderId;
  product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.discount,
    required this.description,
    required this.size,
    required this.qtr,
    required this.orderId,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'price': price,
      'discount': discount,
      'description': description,
      'size': size,
      'qtr':qtr,
      'orderId':orderId
    };
  }
  product.fromMap(){

  }
  String toString() {
    return 'product{id: $id, title: $title, image: $image,price: $price, discount: $discount, description: $description,qtr:$qtr,orderId:$orderId}';
  }

}