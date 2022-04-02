class ApiUrl {
  ApiUrl._();
  ///
  /// APIs Url
  ///
  static const String baseUrl = 'http://mall1.kastana.mobi/zaina/index.php/';
  static const String imageBasePathUrl =
      'http://mall1.kastana.mobi/zaina/uploads/';
  static const String signUp = baseUrl + 'rest/users/add';
  static const String login = baseUrl + 'rest/users/login';
  static const String logout=baseUrl+"rest/users/logout";
  static const String contactUs=baseUrl+'rest/contacts/add';
  static const String googleLogin = baseUrl + 'rest/users/google_register';
  static const String facebookLogin = baseUrl + 'rest/users/facebook_register';
  static const String phoneLogin = baseUrl + 'rest/users/phone_register';
  static const String appleLogin=baseUrl+"rest/users/apple_register";
  static const String aboutUs = baseUrl + 'rest/abouts/get';
  static const String emailVerify = baseUrl + 'rest/users/verify';
  static const String category = baseUrl + 'rest/categories/search';
  static const String shippingMethod=baseUrl+'rest/shippings/get';
  static const String couponDiscount=baseUrl+"rest/coupons/check";
  static const String relatedProduct =baseUrl+
      'rest/products/related_product_trending';
  static const String subCategory = baseUrl + 'rest/subcategories/get';
  static const String products = baseUrl + 'rest/products/search';
  static const String  collections = baseUrl +'rest/collections/get';
  static const String  collectionProducts = baseUrl +'rest/products/all_collection_products';
  static const String productDetail = baseUrl + 'rest/products/get';
  static const String rateProduct=baseUrl+"rest/rates/add_rating";
  static const String notificationList=baseUrl+"rest/notis/all_notis";
  static const String favouriteList = baseUrl + 'rest/products/get_favourite';
  static const String changePassword = baseUrl + "rest/users/password_update";
  static const String forgetPassword = baseUrl + "rest/users/reset";
  static const String updateProfile = baseUrl + "rest/users/profile_update";
  static const String shippingCity =
      baseUrl + 'rest/shipping_zones/get_shipping_city';
  static const String shippingCountry =
      baseUrl + 'rest/shipping_zones/get_shipping_country';
  static const String shippingZone =baseUrl+'rest/shipping_zones/get_shipping_cost';
  static const String brand = baseUrl + 'rest/brands/get';
  static const String sliders = baseUrl + 'rest/sliders/get';
  static const String favouritePost = baseUrl + 'rest/favourites/press';
  static const String appInfo=baseUrl+"rest/appinfo/get_delete_history";
  static const String shopInfo=baseUrl+"rest/shops/get";
  static const String sendOrder=baseUrl+"rest/transactionheaders/submit";
  static const String orders=baseUrl+"rest/transactionheaders/get";
  static const String orderProducts=baseUrl+"rest/transactiondetails/get";
  static const String images = baseUrl+'rest/images/get';
  ///
  /// API Key
  /// If you change here, you need to update in server.
  ///
  static const String apiKey = 'teampsisthebest';
}
