class AppEndpoint {
  AppEndpoint._();

  static const String domain = 'http://192.168.1.3:8000/';
  static const String base = '$domain' 'api/';

  ///
  static const String register = 'register';
  static const String login = 'login';
  static const String forgotPassword = 'password/email';

  ///
  static const String getProducts = 'product';
  static const String getNewProducts = 'new-product';
  static const String getPopularProducts = 'popular-product';
  static const String getProductsInParentCategory = 'product-by-parent-category/';
  static const String getProductsByCategory = 'product-by-category/';

  ///
  static const String getCategories = 'category';
  static const String getParentCategories = 'parent-category';
  static const String getSubCategories = 'get-sub-category/';
}