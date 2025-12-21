
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProdactsService {
  Future<List<ProductModel>> getAllProducts() async {
   List<dynamic>data = await Api().get(
     url: 'https://fakestoreapi.com/products'
    );
    
      List<ProductModel> prosuctsList = [];
      for (int i = 0; i < data.length; i++) {
        prosuctsList.add(ProductModel.fromJson(data[i]));
      }
      return prosuctsList;
    
  
  }
}
