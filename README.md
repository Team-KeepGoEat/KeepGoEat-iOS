# KeepGoEat-iOS
- 킵고잇, 계속 먹어도 괜찮아.

![main](https://user-images.githubusercontent.com/75439868/212343665-3af49999-5f28-4875-a5d0-f3ba1225d67c.png)



## 프로젝트 설명
~~~
좋은 음식은 더 먹고, 나쁜 음식은 덜 먹는 날을 늘려가도록 돕는
즐거운 식습관 기록 서비스, 킵고잇
~~~

## 💻 Developers
|                                            👑 양정연                                              |                                               이승헌                                               |                                               최가연                                               |
| :---------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------: |
| <img src="https://avatars.githubusercontent.com/u/75439868?v=4" width="200px" height="200px" /> | <img src ="https://avatars.githubusercontent.com/u/51286325?v=4" width = "200px" height="200px" /> | <img src ="https://avatars.githubusercontent.com/u/105284376?v=4" width = "200px" height="200px" /> |
|                            [jeongkite](https://github.com/jeongkite)                            |                             [lsh328328](https://github.com/lsh328328)                              |                           [Rody](https://github.com/Gayeonchoi)                                    |
|                                            차분한 눈빛으로 껄껄껄 웃는 김부각쿵야                                              |                                               이유있는 코드를 작성중입니다.                                               |                                               개발이 시시해졌다.                                               |

## 📚 Library
~~~
1. Alamofire
    - Moya 관련 라이브러리
    
2. KakaoOpenSDK
    - 카카오 소셜 로그인을 위한 라이브러리
    
3. Lottie
    - 애니메이션 효과를 가진 뷰를 구현하기 위한 라이브러리
    
4. Moya
    - 세미나때 배운 서버 통신을 위한 라이브러리
    
5. ReactiveSwift
    - Moya 관련 라이브러리
    
6. RxSwift
    - Moya 관련 라이브러리
    
7. SnapKit
    - Code base 개발을 원활하게 도와주는 라이브러리
    
8. Then
    - Code base 개발을 원활하게 도와주는 라이브러리
~~~

## Code Convention
[우리 코드는 이렇게 써보자](https://hip-blender-85f.notion.site/Code-Convention-f7408e1f9a974ed0a43b7fcb7f3625e7)

## Git Convention
[우리 깃은 이렇게 써보자](https://hip-blender-85f.notion.site/Code-Convention-68acf9d8f36f417dbf1d9d720e5272e7)

## Project Structure
```markdown
📦 KeepGoEat-iOS
┣ 📂 Storyboard
┃ ┣ 📜 LaunchScreen.swift
┃
┣ 📂 Application
┃ ┣ 📜 AppDelegate.swift
┃ ┣ 📜 SceneDelegate.swift
┃
┣ 📂 Resource
┃ ┣ 📂 Fonts
┃ ┣ 📜 Assets.xcassets
┃ ┣ 📜 Colors.xcassets
┃ ┣ 📜 info.plist
┃
┣ 📂 Common
┃ ┣ 📂 Consts
┃ ┣ 📂 Extensions
┃ ┣ 📂 Utils
┃
┣ 📂 Presentation
┃ ┣ 📂 Splash
┃ ┣ 📂 Base
┃ ┣ 📂 Onboarding
┃ ┣ 📂 Login
┃ ┣ 📂 Home
┃ ┣ 📂 GoalDetail
┃ ┣ 📂 NewGoal
┃ ┣ 📂 StoreGoal
┃
┣ 📂 Network
┣ 📂 Data
```

## Role
<h3>양정연</h3>
<details>
<summary>홈 : Home</summary>
<ul>
<li>재사용되는 View 분리</li>
<li>UICollectionView</li>
<li>View 파일 분리</li>
<li>HomeView에 모두 합쳐 HomeViewController의 view를 HomeView로 변경해줬다.</li>
</ul>
</details>
<details>
<summary>마이페이지 : StoreGoal</summary>
<ul>
<li>Diffable DataSource</li>
    <ul>
    <li>전체/더 먹기/덜 먹기 필터링 가능</li>
    <li>필터링으로 인한 구성 아이템 변경 시 애니메이션을 위해 사용했다.</li>
    </ul>
</ul>
</details>
<h3>이승헌</h3>
<details>
<summary>스플래시 : Splash</summary>
<ul>
    <li>UIImageView: 스플래쉬 이미지를 넣기 위해 사용했습니다.</li>
</ul>
</details>
<details>
<summary>로그인 : Login</summary>
<ul>
    <li>UIImageView: 로그인 이미지를 넣기 위해 사용했습니다</li>
    <li>UIButton: 서버 로그인 요청을 연결했습니다.</li>
</ul>
</details>
<details>
<summary>목표 상세 : GoalDetail</summary>
<ul>
    <li>UILabel: 해당 뷰의 기본적인 텍스트를 표현했습니다.</li>
    <li>UIButton: 뷰 이동 or 서버 연결에 사용했습니다.</li>
    <li>UIImageView: 바텀시트에 넣을 이미지를 위해 사용했습니다.</li>
    <li>UIStackView: 이번 달 지난달 뷰를 위해 스택뷰를 사용했습니다.</li>
    <li>UICollectionVIew: 이번달 달성 stamp를 표현하기 위해 사용했습니다.</li>
    <li>바텀시트 자체 구현</li>
</ul>
</details>
<h3>최가연</h3>
<details>
<summary>온보딩 : Onboarding</summary>
<ul>
<li>전체적인 뷰를 pageControll / Button / CollectionView /  UIButton으로 나누어 스케치</li>
<li>Pagecontrol로 페이지가 넘어가는 것 구현</li>
<li>CollectionView 안에 <Title Label. Description Label. AnimationView(Lotti)>를 넣어 콜렉션 뷰 셀을 만듦</li>
<li>버튼을 눌러 페이지를 넘기고, 스와이프 해도 뷰가 넘어가도록 기능 구현</li>
</ul>
</details>
<details>
<summary>목표 생성 및 수정 : NewGoal</summary>
<ul>
<li>HeaderView를 불러와 상단바 고정</li>
<li>분기처리로 더먹기/ 덜먹기에 따라 뷰를 전환시킴 (서버에서 받아오는 데이터를 기반으로)</li>
<li>목표 입력 텍스트필드 제한 로직 구현</li>
    <ul>
    <li>텍스팅 시작하면 밑줄 색 바뀜</li>
    <li>15자 이내 글자 수정 (실시간 타이핑 셂)</li>
    <li>특수문자 제한</li>
    <li>키보드 올라옮과 동시에 버튼도 함께 올라옴</li>
    </ul>
</ul>
</details>

## Troubleshooting
<h3>정연</h3>
<details>
<summary>화면전환 후, 토스트 표시</summary>
<ul>
    <li>아이템 추가, 삭제를 할 때 해당 기능을 수행하고 HomeViewController로 돌아와 toast를 띄워야 했다. toast기능 자체가 존재하지 않는 상황도 어려웠지만 View를 전환하고 이를 띄우는 부분이 어려웠다. 이유를 찾는 것에도 시간이 걸렸는데, 그 이유는 내가 뷰의 타입(exist인지 empty인지..) 변수에 didSet을 걸었는데, 거기 뷰 자체를 다시 그리는…(addSubview도 다시 하는….) 그런 짓을 해버려서 홈으로 돌아오면 toast가 뜨지만 view를 첨부터 다시 그려서 바로 덮여버리는 일이 생긴거였다. 그래서 view를 넣었다가 빼는게 아니라 isHidden으로 보였다 숨겼다 처리했다! 그러니까 보이더라~</li>
</ul>
</details>
<details>
<summary>CollectionView footer 크기 조절</summary>
<ul>
    <li>제대로 해결하지 못해서 footer 안에 UIView를 넣어서 그 view의 크기를 조절해줬는데, 이벤트 감지가 애매해서 결국엔 indexPath로 마지막 Cell일 때 Cell 종류를 바꿔주는 식으로 구현했다.</li>
</ul>
</details>
<details>
<summary>TableView에 Diffable DataSource 적용</summary>
<ul>
    <li>기능상 CollectionView로 구현하는 것이 더 적절할 것 같다는 판단으로 구현 방법을 바꿨다. CollectionView로는 큰 이슈 없이 구현할 수 있었다.</li>
</ul>
</details>
<h3>승헌</h3>
<details>
<summary>바텀시트 자체 구현</summary>
<ul>
    <li>바텀 시트를 처음 구현해봤습니다. 단순히 화면에 UIView를 띄워주는 것이 아니었습니다.</li>
    <li>제가 바텀 시트를 띄우고 싶은 뷰의 bottom과 바텀시트 뷰의 top을 맞춰서 평소에는 화면에 띄우지 않고 바텀시트를 나오게 하는 이벤트가 발생했을 때 makeConstraint가 아닌 updateContraint로 바텀 시트 뷰의 레이아웃을 다시 잡아주고 애니메이션을 넣어줬습니다. 여기서 뭔가 어색함을 느꼈는데 바로! 뒷 배의 어두워지는 효과가 없다는 점이었습니다.</li>
    <li>이를 해결하기 위해 뷰와 바텀시트 뷰 사이에 UIView를 넣어주고 (이하 dimmedView) 기본적으로 isHidden을 true로 해주고 바텀 시트가 올라올 때 dimmedView를 isHidden을 false처리 해주었습니다.</li>
</ul>
</details>
<details>
<summary>서버통신 후 데이터 View에 뿌려주기</summary>
<ul>
    <li>무지성 뷰와 뷰컨 분리하기의 후폭풍을 맞은 부분입니다. 뷰컨에서 서버 통신을 하고 얻은 데이터를 각 뷰에 뿌려줄때 계층이 너무 깊어지고 private로 접근지정자를 해놓았던 변수들을 전부 open 접근지정자로 바꿔주었습니다. 코드의 유지보수가 어려워지고 코드의 가독성 또한 나빠졌습니다. 이번 앱잼에서 적용하지는 못했지만 이를 해결하기 위해 차라리 지금 저의 수준에서는 뷰와 뷰컨을 분리하지 않을 것 같습니다.</li>
    <li>앱잼 이후 클린 아키텍쳐에 대해 공부하고 코드 리팩토링을 진행해보려고 합니다.</li>
</ul>
</details>

<h3>가연</h3>
<details>
<summary>전반적인 개발에 대한 어려움</summary>
<ul>
    <li>전반적으로 뷰를 레이아웃 짜는 것에 대한 어려움은 없었습니다. 그러나 기능에 대한 함수 로직들이 처음이어서.. 고생을 했씁니다..흑흑 처음 보는 개념이 많아서 구글링으로 기능을 구현에 대한 방식을 이해한 후 개인 프로젝트 파일에서 뷰를 먼저 구현하는 연습을 했습니다. 연습 전 팀원들에게 ‘내가 ~를 찾아보니 ~한 방향으로 구현을 하면 된다 하더라, 이를 우리 서비스에 반영하기 위해선 ~이렇게 해야할 것 같은데 어떻게 생각하냐?’라고 물어보면서 서치한 자료들이 제가 맡은 뷰에 반영이 가능한지 확인을 했습니다. 이후 코딩을 진행하던 중 도저히 모르겠는 부분이 있으면 우리 사랑스러운 리드인 정연이, 승헌이에게 물어보았고 아이들이 제 코드를 보며 뷰 기능에 맞게 친절한 설명과 함께 수정을 해주며 작업을 진행했습니다! 흑흑 애들아 고마웡</li>
</ul>
</details>
<details>
<summary>제안 사항</summary>
<ul>
    <li>저는 보통 화면 플로우나 기능에 대한 유엑스적인 제안을 했습니다. 홈화면에서 전체 스크롤이 아닌, 목표 보관 리스트들만 스크롤이 되게 하는 것은 어떻냐고 제안하는 등 유엑스적인 측면에서 기능 제안을 했습니다.</li>
</ul>
</details>
<details>
<summary>사랑고백</summary>
<ul>
    <li>처음 개발 프로젝트를 진행하는거라 걱정되기도 해서 미리 승헌이에게 미니세미나 형식의 깃 강의, 객체 지향 설명을 듣고 갔는데 정연이와 승헌이가 차분하게 잘 알려주어 깃 협업을 할 때 충돌은 거의 나지 않아서 뿌듯했습니댜. 우리 정연, 승헌이가 잘 알려줘서 깃을 어떻게 사용하는지에 대한 이해가 생겨서 너무고마워요옹 사랑한당 베이비둘아</li>
</ul>
</details>

![member](https://user-images.githubusercontent.com/75439868/212345026-b90de700-23d0-49ec-9dde-0c0db7163753.png)
