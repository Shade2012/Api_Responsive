
import 'package:api_alya/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ProductController extends GetxController{
  RxBool isLoading = false.obs;
  RxList<ProductResponseModel> productresponsemodel = <ProductResponseModel>[].obs;
  RxBool isMobileLayout = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProduct();
    super.onInit();
    checklayout();
  }
  checklayout(){
    double screenWidth = Get.width;
    isMobileLayout.value = screenWidth < 640;
  }
  void fetchProduct() async {
    isLoading.value = true;
    try{
    final response = await http.get (
        Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline')
    );
    if(response.statusCode == 200){
      productresponsemodel.value = productResponseModelFromJson(response.body);
      isLoading.value = false;
    }else{
      print('Error:  ${response.statusCode}');
    }
  }catch(e){
      print(e);
    }
  }
}
