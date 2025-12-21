import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'Update Product Page';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, img, price, desc;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update Product'),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100),
                CustomTextField(
                  onChanged: (p0) {
                    productName = p0;
                  },
                  hintText: 'Update Name',
                ),
                SizedBox(height: 10),
                CustomTextField(
                  onChanged: (p0) {
                    desc = p0;
                  },
                  hintText: 'Description',
                ),
                SizedBox(height: 10),
                CustomTextField(
                  onChanged: (p0) {
                    price = p0;
                  },
                  inputType: TextInputType.number,
                  hintText: 'Price',
                ),
                SizedBox(height: 10),
                CustomTextField(
                  onChanged: (p0) {
                    img = p0;
                  },
                  hintText: 'Image',
                ),
                SizedBox(height: 50),
                CustomButton(
                  text: 'Update',
                  onTap: () async{
                    isLoading = true;
                    setState(() {});
                    try {
                    await  updateProduct(product);
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Success')));
                    } catch (e) {
                      print(e);
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async{
   await UpdateProductService().updateProduct(
    id: product.id,
      title: productName==null?product.title:productName!,
      price:price==null?product.price.toString():price!,
      image: img==null?product.image:img!,
      desc: desc==null?product.description:desc!,
      category: product.category,
    );
    isLoading = false;
  }
}
