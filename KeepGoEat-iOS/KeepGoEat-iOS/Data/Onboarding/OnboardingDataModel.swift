//
//  OnboardingDataModel.swift
//  KeepGoEat-iOS
//
//  Created by 최가연 on 2023/01/06.
//

import UIKit

struct OnboardingDataModel {
    let title: String
    let descrtiption: String
    let animation: String
}

var onboardingList: [OnboardingDataModel] = [
 OnboardingDataModel(title: "차근차근 식습관 목표를 세워보세요.", descrtiption: "건강한 식습관의 필요성을 느끼셨나요? \n 이제는 조금씩 더 먹고, 덜 먹으며 균형을 맞춰요.", animation: "img_onboarding1"),
 OnboardingDataModel(title: "우리는 같이 해낼 거예요.", descrtiption: "목표를 달성한 날이면 킵고잇을 찾아와 \n 달성 버튼을 눌러주세요.", animation: "img_onboarding1"),
 OnboardingDataModel(title: "완벽하지 않아도 괜찮아요.", descrtiption: "노력한 날들은 빈틈없이 채워질 거예요. \n 성취의 즐거움과 뿌듯함이 오롯이 남아요.", animation: "img_onboarding1")
]
