import 'package:yeka/data/model/response/language_model.dart';

class AppConstants {
  static const String APP_NAME = 'YEKA';
  static const String APP_VERSION = '1.0';

  // static const String BASE_URL = 'https://6valley.6amtech.com';
  // static const String BASE_URL = 'http://52.79.240.88';
  static const String BASE_URL = 'http://172.30.1.95:3000';
  // static const String BASE_URL = 'http://192.168.0.198:3000';
  // static const String USER_ID = 'userId';
  static const String NAME = 'name';

  // ORDER
  static const String ADD_ORDER_URI = "/api/order";
  static const String UPDATE_ORDER_URI = "/api/order";
  static const String DELETE_ORDER_URI = "/api/order";
  static const String LIST_ORDER_URI = "/api/order";
  static const String GET_ORDER_URI = "/api/order";

  // AUTO
  static const String ADD_AUTO_URI = "/api/auto";
  static const String UPDATE_AUTO_URI = "/api/auto";
  static const String DELETE_AUTO_URI = "/api/auto";
  static const String LIST_AUTO_URI = "/api/auto";
  static const String GET_AUTO_URI = "/api/auto";

  // USER
  static const String ADD_USER_URI = "/api/user";
  static const String UPDATE_USER_URI = "/api/user";
  static const String DELETE_USER_URI = "/api/user";
  static const String LIST_USER_URI = "/api/user/list";
  static const String GET_USER_URI = "/api/user";
  static const String GET_SUPER_USER_URI = "/api/user/super";

  // OPTION
  static const String ADD_OPTION_URI = "/api/option";
  static const String UPDATE_OPTION_URI = "/api/option";
  static const String DELETE_OPTION_URI = "/api/option";
  static const String LIST_OPTION_URI = "/api/option";
  static const String GET_OPTION_URI = "/api/option";

  // PRODUCT
  static const String ADD_PRODUCT_URI = "/api/product";
  static const String UPDATE_PRODUCT_URI = "/api/product";
  static const String DELETE_PRODUCT_URI = "/api/product";
  static const String LIST_PRODUCT_URI = "/api/product/list";
  static const String LIST_PRODUCT_MY_FAVORITE_URI = "/api/product/favorite";
  static const String GET_PRODUCT_URI = "/api/product";

  // IMAGE
  static const String ADD_IMAGE_URI = "/api/image";
  static const String UPDATE_IMAGE_URI = "/api/image";
  static const String DELETE_IMAGE_URI = "/api/image";
  static const String LIST_IMAGE_COMMUNITY_URI = "/api/image/community";
  static const String LIST_IMAGE_CONSULTANT_URI = "/api/image/consultant";
  static const String LIST_IMAGE_PRODUCT_URI = "/api/image/product";
  static const String GET_IMAGE_URI = "/api/image";

  // LIKE_PRODUCT
  static const String ADD_LIKE_PRODUCT_URI ="/api/like_product";
  static const String UPDATE_LIKE_PRODUCT_URI ="/api/like_product";
  static const String DELETE_LIKE_PRODUCT_URI ="/api/like_product";
  static const String LIST_LIKE_PRODUCT_URI ="/api/like_product";
  static const String GET_LIKE_PRODUCT_URI ="/api/like_product";

  // CONSULTING
  static const String ADD_CONSULTING_URI = "/api/consulting";
  static const String UPDATE_CONSULTING_URI = "/api/consulting";
  static const String DELETE_CONSULTING_URI = "/api/consulting";
  static const String LIST_CONSULTING_URI = "/api/consulting";
  static const String GET_CONSULTING_URI = "/api/consulting";

  // MENU
  static const String ADD_MENU_URI = "/api/menu";
  static const String UPDATE_MENU_URI = "/api/menu";
  static const String DELETE_MENU_URI = "/api/menu";
  static const String LIST_MENU_URI = "/api/menu";
  static const String GET_MENU_URI = "/api/menu";

  // COMMUNITY
  static const String ADD_COMMUNITY_URI = "/api/community";
  static const String UPDATE_COMMUNITY_URI = "/api/community";
  static const String DELETE_COMMUNITY_URI = "/api/community";
  static const String LIST_COMMUNITY_URI = "/api/community";
  static const String LIST_COMMUNITY_NOTICE_URI = "/api/community/notice";
  static const String LIST_COMMUNITY_YOUTUBE_URI = "/api/community/youtube";
  static const String LIST_COMMUNITY_YOUTUBE_NEWS_URI = "/api/community/youtube/news";
  static const String LIST_COMMUNITY_FREE_BOARD_URI =
      "/api/community/freeboard";
  static const String LIST_COMMUNITY_FREE_BOARD_NEWS_URI =
      "/api/community/freeboard/news";
  static const String GET_COMMUNITY_URI = "/api/community";

  // PERSONAL_COLOR
  static const String ADD_PERSONAL_COLOR_URI ="/api/personal_color";
  static const String UPDATE_PERSONAL_COLOR_URI ="/api/personal_color";
  static const String DELETE_PERSONAL_COLOR_URI ="/api/personal_color";
  static const String LIST_PERSONAL_COLOR_URI ="/api/personal_color";
  static const String GET_PERSONAL_COLOR_URI ="/api/personal_color";


  static const String MAIN_BANNER_URI = '/api/imageSetting';
  static const String ADD_CLIENTS_URI = '/api/clients/add';
  static const String LOGIN_CLIENTS_URI = '/api/clients/login';
  static const String UPDATE_CLIENTS_URI = '/api/clients/edit';
  static const String ADD_PROCESS_URI = '/api/process/add';
  static const String UPDATE_PROCESS_URI = '/api/process/edit';
  static const String BASE_PROCESS_URI = '/api/process';
  static const String ADD_REQUEST_URI = '/api/request/add';
  static const String ADD_REVIEW_URI = '/api/review/add';
  static const String UPDATE_REVIEW_URI = '/api/review/edit';
  static const String BASE_REVIEW_URI = '/api/review';
  static const String ADD_CAR_URI = '/api/carInfo/add';
  static const String BASE_CAR_URI = '/api/carInfo';

  // sharePreference
  static const String TOKEN = 'token';
  static const String USER = 'user';
  static const String USER_USERNAME = 'user_username';
  static const String USER_PASSWORD = 'user_password';
  static const String USER_ID = 'id';
  static const String USER_USER_TYPE = 'user_user_type';
  static const String USER_NAME = 'user_name';
  static const String USER_PHONE = 'user_phone';
  static const String USER_EMAIL = 'user_email';
  static const String USER_GENDER = 'user_GENDER';
  static const String USER_ADDRESS1 = 'user_address1';
  static const String USER_ADDRESS2 = 'user_address2';
  static const String USER_ADDRESS3 = 'user_address3';
  static const String USER_BUSINESS_REGISTRATION_NUMBER =
      'user_business_registration_number';
  static const String USER_BUSINESS_REGISTRATION_FILE =
      'user_business_registration_file';
  static const String USER_HASHTAG = 'user_hashtag';
  static const String USER_RESUME = 'user_resume';
  static const String USER_WORKING_HOUR = 'user_working_hour';
  static const String USER_WITHDRAWAL = 'user_withdrawal';
  static const String USER_BANK1 = 'user_bank1';
  static const String USER_BANK2 = 'user_bank2';
  static const String USER_BANK3 = 'user_bank3';
  static const String USER_CREATE_DATE = 'user_create_date';
  static const String USER_UPDATE_DATE = 'user_update_date';
  static const String USER_DELETE_DATE = 'user_delete_date';
  static const String HOME_ADDRESS = 'home_address';
  static const String SEARCH_ADDRESS = 'search_address';
  static const String OFFICE_ADDRESS = 'office_address';
  static const String CART_LIST = 'cart_list';
  static const String CONFIG = 'config';
  static const String GUEST_MODE = 'guest_mode';
  static const String CURRENCY = 'currency';
  static const String LANG_KEY = 'lang';
  static const String INTRO = 'intro';

  // order status
  static const String PENDING = 'pending';
  static const String CONFIRMED = 'confirmed';
  static const String PROCESSING = 'processing';
  static const String PROCESSED = 'processed';
  static const String DELIVERED = 'delivered';
  static const String FAILED = 'failed';
  static const String RETURNED = 'returned';
  static const String CANCELLED = 'canceled';
  static const String OUT_FOR_DELIVERY = 'out_for_delivery';
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static const String THEME = 'theme';
  static const String TOPIC = 'sixvalley';
  static const String USER_ADDRESS = 'user_address';

  static const String CONFIG_URI = '/api/v1/config';
  static const String MESSAGES_URI = '/api/v1/customer/chat/messages?shop_id=';
  static const String CHAT_INFO_URI = '/api/v1/customer/chat';
  static const String SEND_MESSAGE_URI = '/api/v1/customer/chat/send-message';
  static const String TOKEN_URI = '/api/v1/customer/cm-firebase-token';
  static const String NOTIFICATION_URI = '/api/v1/notifications';

  //Todo 로그인 관련 6개
  static const String LOGIN_URI = '/api/user/login';
  static const String REGISTRATION_URI = '/api/user/register';
  static const String FORGET_PASSWORD_URI = '/api/user/forgot-password';
  static const String CHECK_USERNAME_URI = '/api/user/check-username';
  static const String VERIFY_USERNAME_URI = '/api/user/verify-username';
  static const String RESET_PASSWORD_URI = '/api/user/reset-password';

  // static const String CHECK_PHONE_URI = '/api/v1/auth/check-phone';
  // static const String VERIFY_PHONE_URI = '/api/v1/auth/verify-phone';
  // static const String SOCIAL_LOGIN_URI = '/api/v1/auth/social-login';
  // static const String VERIFY_OTP_URI = '/api/v1/auth/verify-otp';

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: '',
        languageName: '한국어',
        countryCode: 'KR',
        languageCode: 'ko'),
    LanguageModel(
        imageUrl: '',
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: '',
        languageName: 'Arabic',
        countryCode: 'SA',
        languageCode: 'ar'),
  ];

/*
  static const String CATEGORIES_URI = '/api/v1/categories';
  static const String BRANDS_URI = '/api/v1/brands';
  static const String BRAND_PRODUCT_URI = '/api/v1/brands/products/';
  static const String CATEGORY_PRODUCT_URI = '/api/v1/categories/products/';
  static const String REGISTRATION_URI = '/api/v1/auth/register';
  static const String LOGIN_URI = '/api/v1/auth/login';
  static const String LATEST_PRODUCTS_URI = '/api/v1/products/latest?limit=10&&offset=';
  static const String NEW_ARRIVAL_PRODUCTS_URI = '/api/v1/products/latest?limit=6&&offset=';
  static const String TOP_PRODUCTS_URI = '/api/v1/products/top-rated?limit=10&&offset=';
  static const String BEST_SELLING_PRODUCTS_URI = '/api/v1/products/best-sellings?limit=1&offset=';
  static const String DISCOUNTED_PRODUCTS_URI = '/api/v1/products/discounted-product?limit=10&&offset=';
  static const String FEATURED_PRODUCTS_URI = '/api/v1/products/featured?limit=10&&offset=';
  static const String HOME_CATEGORY_PRODUCTS_URI = '/api/v1/products/home-categories';
  static const String PRODUCT_DETAILS_URI = '/api/v1/products/details/';
  static const String PRODUCT_REVIEW_URI = '/api/v1/products/reviews/';
  static const String SEARCH_URI = '/api/v1/products/search?name=';
  static const String CONFIG_URI = '/api/v1/config';
  static const String ADD_WISH_LIST_URI = '/api/v1/customer/wish-list/add?product_id=';
  static const String REMOVE_WISH_LIST_URI = '/api/v1/customer/wish-list/remove?product_id=';
  static const String UPDATE_PROFILE_URI = '/api/v1/customer/update-profile';
  static const String CUSTOMER_URI = '/api/v1/customer/info';
  static const String ADDRESS_LIST_URI = '/api/v1/customer/address/list';
  static const String REMOVE_ADDRESS_URI = '/api/v1/customer/address?address_id=';
  static const String ADD_ADDRESS_URI = '/api/v1/customer/address/add';
  static const String WISH_LIST_GET_URI = '/api/v1/customer/wish-list';
  static const String SUPPORT_TICKET_URI = '/api/v1/customer/support-ticket/create';
  // static const String MAIN_BANNER_URI = '/api/v1/banners?banner_type=main_banner';
  static const String FOOTER_BANNER_URI = '/api/v1/banners?banner_type=footer_banner';
  static const String MAIN_SECTION_BANNER_URI = '/api/v1/banners?banner_type=main_section_banner';
  static const String RELATED_PRODUCT_URI = '/api/v1/products/related-products/';
  static const String ORDER_URI = '/api/v1/customer/order/list';
  static const String ORDER_DETAILS_URI = '/api/v1/customer/order/details?order_id=';
  static const String ORDER_PLACE_URI = '/api/v1/customer/order/place';
  static const String SELLER_URI = '/api/v1/seller?seller_id=';
  static const String SELLER_PRODUCT_URI = '/api/v1/seller/';
  static const String TOP_SELLER = '/api/v1/seller/top';
  static const String TRACKING_URI = '/api/v1/order/track?order_id=';
  static const String FORGET_PASSWORD_URI = '/api/v1/auth/forgot-password';
  static const String SUPPORT_TICKET_GET_URI = '/api/v1/customer/support-ticket/get';
  static const String SUPPORT_TICKET_CONV_URI = '/api/v1/customer/support-ticket/conv/';
  static const String SUPPORT_TICKET_REPLY_URI = '/api/v1/customer/support-ticket/reply/';
  static const String SUBMIT_REVIEW_URI = '/api/v1/products/reviews/submit';
  static const String FLASH_DEAL_URI = '/api/v1/flash-deals';
  static const String FEATURED_DEAL_URI = '/api/v1/deals/featured';
  static const String FLASH_DEAL_PRODUCT_URI = '/api/v1/flash-deals/products/';
  static const String COUNTER_URI = '/api/v1/products/counter/';
  static const String SOCIAL_LINK_URI = '/api/v1/products/social-share-link/';
  static const String SHIPPING_URI = '/api/v1/products/shipping-methods';
  static const String CHOSEN_SHIPPING_URI = '/api/v1/shipping-method/chosen';
  static const String COUPON_URI = '/api/v1/coupon/apply?code=';
  static const String MESSAGES_URI = '/api/v1/customer/chat/messages?shop_id=';
  static const String CHAT_INFO_URI = '/api/v1/customer/chat';
  static const String SEND_MESSAGE_URI = '/api/v1/customer/chat/send-message';
  static const String TOKEN_URI = '/api/v1/customer/cm-firebase-token';
  static const String NOTIFICATION_URI = '/api/v1/notifications';
  static const String GET_CART_DATA_URI = '/api/v1/cart';
  static const String ADD_TO_CART_URI = '/api/v1/cart/add';
  static const String UPDATE_CART_QUANTITY_URI = '/api/v1/cart/update';
  static const String REMOVE_FROM_CART_URI = '/api/v1/cart/remove';
  static const String GET_SHIPPING_METHOD = '/api/v1/shipping-method/by-seller';
  static const String CHOOSE_SHIPPING_METHOD = '/api/v1/shipping-method/choose-for-order';
  static const String CHOSEN_SHIPPING_METHOD_URI = '/api/v1/shipping-method/chosen';
  static const String GET_SHIPPING_INFO = '/api/v1/shipping-method/detail/1';
  static const String CHECK_PHONE_URI = '/api/v1/auth/check-phone';
  static const String VERIFY_PHONE_URI = '/api/v1/auth/verify-phone';
  static const String SOCIAL_LOGIN_URI = '/api/v1/auth/social-login';
  static const String CHECK_EMAIL_URI = '/api/v1/auth/check-email';
  static const String VERIFY_EMAIL_URI = '/api/v1/auth/verify-email';
  static const String RESET_PASSWORD_URI = '/api/v1/auth/reset-password';
  static const String VERIFY_OTP_URI = '/api/v1/auth/verify-otp';
  static const String REFUND_REQUEST_URI = '/api/v1/customer/order/refund-store';
  static const String REFUND_REQUEST_PRE_REQ_URI = '/api/v1/customer/order/refund';
  static const String REFUND_RESULT_URI = '/api/v1/customer/order/refund-details';
  static const String CANCEL_ORDER_URI = '/api/v1/order/cancel-order';
  static const String GET_SELECTED_SHIPPING_TYPE_URI = '/api/v1/shipping-method/check-shipping-type';
  static const String DEAL_OF_THE_DAY_URI = '/api/v1/dealsoftheday/deal-of-the-day';
  static const String WALLET_TRANSACTION_URI = '/api/v1/customer/wallet/list?limit=10&offset=';
  static const String LOYALTY_POINT_URI = '/api/v1/customer/loyalty/list?limit=20&offset=';
  static const String LOYALTY_POINT_CONVERT_URI = '/api/v1/customer/loyalty/loyalty-exchange-currency';
  static const String DELETE_CUSTOMER_ACCOUNT = '/api/v1/customer/account-delete';

  //address
  static const String UPDATE_ADDRESS_URI = '/api/v1/customer/address/update/';
  static const String GEOCODE_URI = '/api/v1/mapapi/geocode-api';
  static const String SEARCH_LOCATION_URI = '/api/v1/mapapi/place-api-autocomplete';
  static const String PLACE_DETAILS_URI = '/api/v1/mapapi/place-api-details';
  static const String DISTANCE_MATRIX_URI = '/api/v1/mapapi/distance-api';
*/
}
