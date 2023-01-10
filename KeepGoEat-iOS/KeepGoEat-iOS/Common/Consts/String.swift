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
        static let kakaoLogin = "카카오톡 로그인"
        
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
        
        // MARK: NewGoal
        static let textMyGoalTitle = "나의 목표를 입력해볼까요?"
        static let moreVegetablePlaceHoleder = "ex) 하루 1끼 이상 야채"
        static let textCount = "(0/20)"
        static let moreEat =  "더먹기"
        static let lessEat = "덜먹기"
        static let complete = "완료"
        static let warning = "한글, 영문,숫자만 입력 가능합니다."
        
        // MARK: StoreGoal
        static let storeTitle = "보관한 목표"
        static let storeFilterAll = "전체"
        static let storeFilterMore = "더먹기"
        static let storeFilterLess = "덜먹기"
    }
}
