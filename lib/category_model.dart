class Category{
  int? categoryId;
  String? categoryName;

  Category(this.categoryId,this.categoryName);

  Category.fromMap(Map<dynamic,dynamic> map){
    categoryId = map['category_id'];
    categoryName = map['category_name'];
  }

  Map<dynamic, dynamic> toMap(){
    return{
      "category_id" : categoryId,
      "category_name" : categoryName
    };
  }

}