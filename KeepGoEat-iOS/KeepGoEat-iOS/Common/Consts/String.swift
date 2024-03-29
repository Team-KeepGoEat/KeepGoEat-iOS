//
//  String.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/31.
//

import Foundation

extension Const {
    struct String {
        
        // MARK: Keychain
        static let userAccessToken = "userAccessToken"
        static let userRefreshToken = "userRefreshToken"
        
        // MARK: Onboarding
        
        // MARK: Login
        static let appleLogin = "Apple로 로그인"
        static let kakaoLogin = "카카오톡으로 로그인"
        
        // MARK: Home
        static let hoemHeader = "오늘 식습관 목표"
        static let homeEmptyTitle = "아직 목표를 정하지 않았어요."
        static let homeEmptySub = "새로운 목표를 추가해보세요."
        static let homeAddGoal = "목표 추가하기"
        static let homeCountGuide = " 일 해냈어요"
        static let homeMoreButtonBefore = "오늘도 잘 먹었나요?"
        static let homeLessButtonBefore = "오늘도 잘 참았나요?"
        static let homeMoreButtonAfter = "오늘도 해냈어요!"
        static let homeLessButtonAfter = "오늘도 참았어요!"
        static let homeNewTitle = "또 다른 도전을 원하시나요?"
        static let homeNewSub1 = "2개의 목표를 더 정할 수 있어요."
        static let homeNewSub2 = "1개의 목표를 더 정할 수 있어요."
        static let homeNewSub3 = "3개의 목표까지 동시에 진행할 수 있어요."
        static let homeNewBottomSubMore = "건강한 음식을 더 먹어볼까?"
        static let homeNewBottomSubLess = "안 좋은 식습관을 줄여가보자!"
        static let createGoalToastMessage = "목표가 생성되었습니다."
        static let deleteGoalToastMessage = "목표가 삭제되었습니다."
        static let storeGoalToastMessage = "목표가 보관되었습니다."
        
        // MARK: GoalDetail
        static let myGoal = "나의 목표"
        static let previousMoreGoalStatsTitle = "지난달 먹은 날"
        static let presentMoreGoalStatsTitle = "이번달 먹은 날"
        static let previousLessGoalStatsTitle = "지난달 참은 날"
        static let presentLessGoalStatsTitle = "이번달 참은 날"
        static let goalDetailBottomSheetTitle = "목표 달성이 끝났나요?\n달성 완료된 목표는 보관해서 모아볼 수 있어요."
        static let goalDetailBottomSheetSaveButton = "목표 보관하기"
        static let goalDetailBottomSheetDeleteButton = "잘못된 목표인가요? 삭제하기"
        static let deleteTitle = "삭제하시겠어요?"
        static let deleteDescription = "삭제한 목표는 복구할 수 없어요."
        static let cancelButton = "아니오"
        static let deleteButton = "네, 삭제할래요"
        static let editGoalToastMessage = "목표가 수정되었습니다."
        
        // MARK: NewGoal
        static let textMyGoalTitle = "나의 목표를 입력해 볼까요? *"
        static let GoalHeader = "목표 입력"
        static let textCount = "(0/15)"
        static let moreEatPlaceHoleder = "ex) 물                    "
        static let lessEatPlaceHoleder = "ex) 커피                    "
        static let moreEat =  "더 먹기"
        static let lessEat = "덜 먹기"
        static let complete = "완료"
        static let warning = "한글, 영문,숫자만 입력 가능합니다."
        static let emptyWarning = "목표는 최소 1글자 이상 입력해주세요."
        static let textStandardTitle = "목표 달성 기준을 세워볼까요?"
        static let textFitStandard = "나에게 맞는 달성 기준을 세워요."
        static let textCount2 = "(0/20)"
        static let detailEatTextField = "ex) 하루에 2L씩 마시기     "
        static let detailEatTextField2 = "ex) 아침에 딱 1잔만 마시기     "
        
        // MARK: StoreGoal
        static let storeTitle = "보관한 목표"
        static let storeFilterAll = "전체"
        static let totalSub = "총 달성일"
        static let termSub = "진행기간"
        static let saveGoalToastMessage = "목표가 저장되었습니다."
        static let storeEmptyTitle = "더이상 기록하지 않는 목표는 보관해요."
        static let storeEmptySub = "진행하지 않는 목표가 생긴다면,\n그동안의 노력을 지우지 말고 남겨보세요."
        
        // MARK: MyPage
        static let myPage = "마이페이지"
        static let storeGoal = "보관한 목표"
        static let contactAndReview = "문의 및 피드백"
        static let contact = "문의하기"
        static let review = "리뷰 남기기"
        static let appInfo = "앱 정보"
        static let servicePresent = "서비스 소개"
        static let versionInfo = "버전 정보"
        static let version = "1.0.0"
        static let termsAndPrivacy = "약관 및 정책"
        static let serviceTerms = "서비스 이용약관"
        static let privacy = "개인정보처리방침"
        
        // MARK: ServiceIntro
        static let serviceIntro =
        "킵고잇은\n영양소나 칼로리처럼 복잡한 방법 대신\n가볍고, 지속가능한 식습관 관리를\n돕기 위해 탄생했어요.\n\n늘리거나 줄이고 싶은 식습관 목표를 설정하고,\n목표를 달성한 날이면 킵고잇을 찾아와주세요.\n건강한 하루하루를 기록할 수 있어요.\n\n매일 완벽한 식사만을 하기란 어렵죠.\n대신 건강하지 않은 음식을 덜 먹고,\n건강한 음식을 더 먹은 날을 늘려가볼까요?\n\n먹는 건 원래 즐거운 일이니까.\n완벽한 식사에 대한 부담 없이\n킵고잇에서 건강한 즐거움을 쌓아보세요."
        static let openSource = "오픈소스 라이선스"
        
        // MARK: AccountInfo
        static let accountInfoHeader = "계정 정보"
        static let logout = "로그아웃"
        static let withdrawal = "탈퇴하기"
        static let logoutTitle = "로그아웃 하시겠어요?"
        static let logoutDescription = "그동안의 기록은 사라지지 않으니\n안심하고 다녀오세요."
        static let noButton = "취소"
        static let yesButton = "네"
        
        // MARK: Withdrawal
        static let withdrawalTitle = "그동안 함께 해서 기뻤어요"
        static let withdrawalDescription = "떠나는 이유를 모두 알려주시면 더 나은 킵고잇이 될게요."
        static let stopEatCheckBox = "식습관 관리를 그만 뒀어요."
        static let notUseCheckBox = "자주 사용하지 않아요."
        static let errorCheckBox = "앱 오류가 있어요."
        static let badContentsCheckBox = "콘텐츠가 만족스럽지 않아요."
        static let manualInputCheckBox = "직접 입력"
        static let manualInputDescription = "다른 이유가 있다면 알려주세요."
        static let manualInputMessage = "탈퇴 이유를 작성해주세요."
        static let withdrawalAlertTitle = "탈퇴는 되돌릴 수 없어요"
        static let withdrawalAlertDescription = "이 계정에서 만든 목표와\n활동 기록이 모두 사라져요."
        static let withdrawalAlertButton = "탈퇴"
    }
}
