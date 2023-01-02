import 'package:yeka/data/model/response/language_model.dart';

class AppConstants {
  static const String APP_NAME = 'YEKA';
  static const String APP_VERSION = '1.0';

  // static const String BASE_URL = 'https://6valley.6amtech.com';
  // static const String BASE_URL = 'http://52.79.240.88';
  static const String BASE_URL = 'http://172.30.1.95:3000';
  // static const String BASE_URL = 'http://172.30.1.19:3000';
  // static const String BASE_URL = 'http://192.168.0.198:3000';
  // static const String BASE_URL = 'http://3.34.187.112:3000';
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
  static const String LIST_USER_CONSULTANT_URI = "/api/user/consultant";
  static const String LIST_USER_CONSULTANT_ADDRESS_URI = "/api/user/consultant/address";
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
  static const String ADD_IMAGE_PRODUCT_URI = "/api/image/product";
  static const String ADD_IMAGE_USER_URI = "/api/image/user";
  static const String ADD_IMAGE_COMMUNITY_URI = "/api/image/community";
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
  static const String LIST_CONSULTING_CONSULTANT_URI = "/api/consulting/consultant";
  static const String GET_CONSULTING_URI = "/api/consulting";
  static const String GET_CONSULTING_BY_CLIENT_ID_URI = "/api/consulting/client";

  // MENU
  static const String ADD_MENU_URI = "/api/menu";
  static const String UPDATE_MENU_URI = "/api/menu";
  static const String DELETE_MENU_URI = "/api/menu";
  static const String LIST_MENU_URI = "/api/menu";
  static const String LIST_MENU_CONSULTANT_URI = "/api/menu/consultant";
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
  static const String GET_PERSONAL_COLOR_CONDITION_URI ="/api/personal_color/condition";


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
  static const String USER_GENDER = 'user_gender';
  static const String USER_ADDRESS1 = 'user_address1';
  static const String USER_ADDRESS2 = 'user_address2';
  static const String USER_ADDRESS3 = 'user_address3';
  static const String USER_SEASON = 'user_season';
  static const String USER_DETAIL_SEASON_TYPE = 'user_detail_season_type';
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

  static const AREA_CODE = [
    {
      "전체": [],
      "서울특별시": [
        "종로구",
        "중구",
        "용산구",
        "성동구",
        "광진구",
        "동대문구",
        "중랑구",
        "성북구",
        "강북구",
        "도봉구",
        "노원구",
        "은평구",
        "서대문구",
        "마포구",
        "양천구",
        "강서구",
        "구로구",
        "금천구",
        "영등포구",
        "동작구",
        "관악구",
        "서초구",
        "강남구",
        "송파구",
        "강동구"
      ]
    },
    {
      "부산광역시": [
        "중구",
        "서구",
        "동구",
        "영도구",
        "부산진구",
        "동래구",
        "남구",
        "북구",
        "강서구",
        "해운대구",
        "사하구",
        "금정구",
        "연제구",
        "수영구",
        "사상구",
        "기장군"
      ]
    },
    {
      "인천광역시": [
        "중구",
        "동구",
        "남구",
        "연수구",
        "남동구",
        "부평구",
        "계양구",
        "서구",
        "강화군",
        "옹진군"
      ]
    },
    {
      "대구광역시": ["중구", "동구", "서구", "남구", "북구", "수성구", "달서구", "달성군"]
    },
    {
      "광주광역시": ["동구", "서구", "남구", "북구", "광산구"]
    },
    {
      "대전광역시": ["동구", "중구", "서구", "유성구", "대덕구"]
    },
    {
      "울산광역시": ["중구", "남구", "동구", "북구", "울주군"]
    },
    {"세종특별자치시": []},
    {
      "경기도": [
        "가평군",
        "고양시",
        "과천시",
        "광명시",
        "광주시",
        "구리시",
        "군포시",
        "김포시",
        "남양주시",
        "동두천시",
        "부천시",
        "성남시",
        "수원시",
        "시흥시",
        "안산시",
        "안성시",
        "안양시",
        "양주시",
        "양평군",
        "여주시",
        "연천군",
        "오산시",
        "용인시",
        "의왕시",
        "의정부시",
        "이천시",
        "파주시",
        "평택시",
        "포천시",
        "하남시",
        "화성시"
      ]
    },
    {
      "강원도": [
        "원주시",
        "춘천시",
        "강릉시",
        "동해시",
        "속초시",
        "삼척시",
        "홍천군",
        "태백시",
        "철원군",
        "횡성군",
        "평창군",
        "영월군",
        "정선군",
        "인제군",
        "고성군",
        "양양군",
        "화천군",
        "양구군"
      ]
    },
    {
      "충청북도": [
        "청주시",
        "충주시",
        "제천시",
        "보은군",
        "옥천군",
        "영동군",
        "증평군",
        "진천군",
        "괴산군",
        "음성군",
        "단양군"
      ]
    },
    {
      "충청남도": [
        "천안시",
        "공주시",
        "보령시",
        "아산시",
        "서산시",
        "논산시",
        "계룡시",
        "당진시",
        "금산군",
        "부여군",
        "서천군",
        "청양군",
        "홍성군",
        "예산군",
        "태안군"
      ]
    },
    {
      "경상북도": [
        "포항시",
        "경주시",
        "김천시",
        "안동시",
        "구미시",
        "영주시",
        "영천시",
        "상주시",
        "문경시",
        "경산시",
        "군위군",
        "의성군",
        "청송군",
        "영양군",
        "영덕군",
        "청도군",
        "고령군",
        "성주군",
        "칠곡군",
        "예천군",
        "봉화군",
        "울진군",
        "울릉군"
      ]
    },
    {
      "경상남도": [
        "창원시",
        "김해시",
        "진주시",
        "양산시",
        "거제시",
        "통영시",
        "사천시",
        "밀양시",
        "함안군",
        "거창군",
        "창녕군",
        "고성군",
        "하동군",
        "합천군",
        "남해군",
        "함양군",
        "산청군",
        "의령군"
      ]
    },
    {
      "전라북도": [
        "전주시",
        "익산시",
        "군산시",
        "정읍시",
        "완주군",
        "김제시",
        "남원시",
        "고창군",
        "부안군",
        "임실군",
        "순창군",
        "진안군",
        "장수군",
        "무주군"
      ]
    },
    {
      "전라남도": [
        "여수시",
        "순천시",
        "목포시",
        "광양시",
        "나주시",
        "무안군",
        "해남군",
        "고흥군",
        "화순군",
        "영암군",
        "영광군",
        "완도군",
        "담양군",
        "장성군",
        "보성군",
        "신안군",
        "장흥군",
        "강진군",
        "함평군",
        "진도군",
        "곡성군",
        "구례군"
      ]
    },
    {
      "제주특별자치도": ["제주시", "서귀포시"]
    }
  ];

  static const CITY_CODE = [
    "",
    "서울",
    "부산",
    "인천",
    "대구",
    "광주",
    "대전",
    "울산",
    "세종",
    "경기",
    "강원",
    "충북",
    "충남",
    "경북",
    "경남",
    "전북",
    "전남",
    "제주"
  ];

  static const BANK_CODE = {
    "001": "한국은행",
    "002": "산업은행",
    "003": "기업은행",
    "004": "국민은행",
    "007": "수협은행",
    "008": "수출입은행",
    "011": "NH농협은행",
    "012": "지역농축협",
    "020": "우리은행",
    "023": "SC제일은행",
    "027": "한국씨티은행",
    "031": "대구은행",
    "032": "부산은행",
    "034": "광주은행",
    "035": "제주은행",
    "037": "전북은행",
    "039": "경남은행",
    "041": "우리카드",
    "045": "새마을금고",
    "048": "신협",
    "050": "저축은행",
    "052": "모건스탠리은행",
    "054": "HSBC은행",
    "055": "도이치은행",
    "057": "제이피모간체이스은행",
    "058": "미즈호은행",
    "059": "엠유에프지은행",
    "060": "BOA은행",
    "061": "비엔피파리바은행",
    "062": "중국공상은행",
    "063": "중국은행",
    "064": "산림조합중앙회",
    "065": "대화은행",
    "066": "교통은행",
    "067": "중국건설은행",
    "071": "우체국",
    "076": "신용보증기금",
    "077": "기술보증기금",
    "081": "하나은행",
    "088": "신한은행",
    "089": "케이뱅크",
    "090": "카카오뱅크",
    "092": "토스뱅크"
  };

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
