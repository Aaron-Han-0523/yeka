# lib 디렉토리 구조
1. data
    1) datasource : dio 객체 관리
    2) model : database table을 참조하여 작성, get/set, json parse 등 처리
    3) repository : url 및 dio 호출, app_constants 에 url 상수로 등록
2. helper
    1) date_converter
    2) email_checker
    3) json_converter
    4) price_converter
3. localization
   다국어 적용
   example : getTranslated('CONTENTS_HINT', context)
   다국어 json 파일 위치 : assets/language/ko.json
4. provider
   백엔드 api 연동
   data - repository 호출 - response 로 json parse 하여 model 에 담아서 사용
5. theme
   dark / light 테마 제공
6. util
    1) app_constants : base_url, url, 상수 등록
    2) images : assets 에 있는 이미지 경로 등록
7. view
    1) basewidget : appbar, button, dialog, dropdown, radio, textarea, textfield 등의 기본 위젯 등록
    2) screen : 아래 참조, 사용자에게 보여줄 화면을 구성

# lib/screen 디렉토리 구조
1. chat
2. disposal : 폐차 화면
3. home : 메인 화면
    1) widget
4. myprocess : 내 진행 현황 화면
5. onboarding : 온보딩 화면
6. review : 이용 후기 화면
7. setting : 설정 화면
8. splash : 스플래시 화면

# backend call 구조
provider 패턴은 하나의 객체만 유지
1. provider 패턴 호출 순서
    1) screen
    2) provider
    3) repo
    4) model
2. provider 패턴 등록
    1) di_container
    2) main

# bin 에서 auto gen 사용 방법
front end의 MVC 기본 파일을 모두 자동으로 생성해준다.
1. 경로
   1) cd bin
2. bin/table 작성법
   1) 기존 파일을 참조
   2) create_date, update_date, delete_date 아래에 오는 필드는 테이블에 존재하지 않고 backend 서버에서 join 으로 만들어진 필드이다.
3. 실행 명령어
   1) python3 autoGenModel.py
   2) python3 autoGenProvider.py auto_provider.py
   3) python3 autoGenRepo.py auto_repo.py
   
# 각종 계정 정보(비밀번호 담당자 문의)
1. 구글플레이 개발자 계정
   yekakorea@gmail.com
2. 애플 개발자 계정
   00angela@naver.com
3. aws 계정
   byherimage

# 인프라 정보(aws)
dev : 52.79.240.88
prd : not provisioning

# 관리자 페이지 접속 정보
admin / admin

# 코딩 패턴1 (navigator)
```dart
Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImageUploadPage(),),),
Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => HomePage()),(route) => false);
Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => HomePage()),(route) => false);

Navigator.push(context,
  PageRouteBuilder(transitionDuration: Duration(milliseconds: 1000),
    pageBuilder: (context, anim1, anim2) => ProductDetailPage(productModel: productModel, isCreateScreen: false),
  ),
),

Navigator.popAndPushNamed(context, SecondScreen.routeName);
Navigator.pushNamedAndRemoveUntil(context, ThirdScreen.routeName, ModalRoute.withName(SecondScreen.routeName), arguments: {"update": true});
Navigator.pushNamed(context, ThirdScreen.routeName, arguments: {"update": true});
Navigator.pushNamed(context, SecondScreen.routeName,);
Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdScreen(update: true)));
```

# 코딩 패턴2 (ui 만들기)
세로로 쌓을 때 : Column
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  ]
)
```

가로로 쌓을 때 : Row
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  ]
)
```

간격 조정 : Container
```dart
Container(
  alignment: Alignment.centerLeft,
  width: MediaQuery.of(context).size.width + 100,
  padding: EdgeInsets.fromLTRB(
    Dimensions.HOME_PAGE_PADDING,
    Dimensions.HOME_PAGE_PADDING,
    Dimensions.HOME_PAGE_PADDING,
    Dimensions.PADDING_SIZE_LARGE,
  ),
  margin: EdgeInsets.fromLTRB(
    Dimensions.HOME_PAGE_PADDING,
    Dimensions.HOME_PAGE_PADDING,
    Dimensions.HOME_PAGE_PADDING,
    Dimensions.PADDING_SIZE_LARGE,
  ),
  decoration: BoxDecoration(
    color: Color(0xff121212),
    borderRadius: BorderRadius.circular(30),
    width: 1,
  ),
),
```

텍스트 : Text
```dart
Text(
  "${widget.communityModel.community_title}",
  style: TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    color: Color(0xff333333),
    overflow: TextOverflow.ellipsis,
  ),
  textAlign: TextAlign.start,
),
```

이미지 : Image
```dart
ClipRRect(
  borderRadius: BorderRadius.circular(150.0),
  child: Image.asset(
    Images.privacy,
    fit: BoxFit.fill,
    height: 25,
  ),
),

ClipRRect(
  borderRadius: BorderRadius.circular(150.0),
  child: Image.network(
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
    fit: BoxFit.fill,
    height: 107,
  ),
),

FadeInImage.assetNetwork(
  placeholder: Images.placeholder1,
  image: image.path != null
    ? AppConstants.BASE_URL + "/" + image.path
          : AppConstants.BASE_URL,
  fit: BoxFit.cover,
  width: MediaQuery.of(context).size.width * 0.28,
  height: MediaQuery.of(context).size.width * 0.28,
)
```

아이콘 : Icon
```dart
Icon(
  Icons.login,
  color: Colors.green,
  size: 30.0,
),
```

간격 조정 : SizedBox
```dart
SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
```

수평선 : Divider
```dart
const Divider(
  height: 1,
  thickness: 1,
  indent: 0,
  endIndent: 0,
  color: Color(0xffDDDDDD),
),
```

# 코딩 패턴3 (event, constant)
이벤트 핸들러 : InkWell
```dart
InkWell(
  onTap: () {},
  child:Container()),
```

Provider 사용법 : Provider.of<ProductProvider>(context, listen: false)
```dart
Provider.of<ProductProvider>(context, listen: false).getLatestProductList(0, context, reload: reload);
Provider.of<ProductProvider>(context, listen: false).getProductList();
Provider.of<ProductProvider>(context, listen: false).productList;
```

전역 상수 및 다국어
```dart
getTranslated('CONTENTS_HINT', context)
AppConstants.BASE_URL
Images.heart
```

알럿창, alert
```dart
void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              // title: new Text("Dialog Title"),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  Row(
                    children: [
                      Text(
                        "진행 중입니다.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("취소"),
                  onPressed: () {
                    return Navigator.pop(context);
                  },
                ),
                Container(
                  child: CupertinoDialogAction(
                    child: Container(
                      child: Text(
                        "확인",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => HomePage()),
                          (route) => false);
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Color(0XFF2434D7),
                  ),
                ),
              ],
            ));
  }
```

