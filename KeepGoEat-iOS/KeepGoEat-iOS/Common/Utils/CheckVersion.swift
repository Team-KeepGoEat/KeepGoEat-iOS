//
//  CheckVersion.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/04/15.
//

import UIKit

import Siren

public func checkVersion() {
    let siren = Siren.shared
    siren.apiManager = APIManager(country: .korea)
    siren.presentationManager = PresentationManager(forceLanguageLocalization: .korean)
    // annoying: (항상 확인) / 다음에 업데이트
    // critical: (항상 확인) / 즉시 업데이트
    // default: (하루 한 번) / 다음에 업데이트 / 버전 건너 뜀
    siren.rulesManager = RulesManager(majorUpdateRules: .critical,
                                      minorUpdateRules: .default,
                                      patchUpdateRules: .annoying)
    siren.wail()
}
