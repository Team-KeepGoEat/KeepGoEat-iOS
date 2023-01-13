# KeepGoEat-iOS
킵고잇, 계속 먹어도 괜찮아.

![네이밍공모전](https://user-images.githubusercontent.com/75439868/209621755-9604686a-b3c3-4d21-b593-51be07a5f0df.png)

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
    <li>UIButton: 서버 로그인 요청을 연결했습니다.<li>
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
