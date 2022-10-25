class CategoryModel {
  int id=0;
  String image='';
  String item='';


  CategoryModel({this.id=0, this.image='', this.item=''});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    item = json['item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['item'] = this.item;
    return data;
  }

}
class ProductDetails {
  int? id;
  String? title;
  String? image;
  String? price;
  String? discount;
  String? description;
  int? status;
  String? size;
  int? stock;

  ProductDetails(
      {
        this.id,
        this.title,
        this.image,
        this.price,
        this.discount,
        this.description,
        this.status,
        this.size,
        this.stock});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    price = json['price'];
    discount = json['discount'];
    description = json['description'];
    status = json['status'];
    size = json['size'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['description'] = this.description;
    data['status'] = this.status;
    data['size'] = this.size;
    data['stock'] = this.stock;
    return data;
  }
}
// class Sections {
//   int? id;
//   String? name;
//   int? status;
//   Sections({this.id, this.name, this.status});
//
//   Sections.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     status = json['status'];
//   }
//
// }
class Sections {
  int? id;
  String? name;
  int? status;
  List<ProductDetails>? products;

  Sections({this.id, this.name, this.status, this.products});

  Sections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    if (json['products'] != null) {
      products = <ProductDetails>[];
      json['products'].forEach((v) {
        products!.add(new ProductDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

