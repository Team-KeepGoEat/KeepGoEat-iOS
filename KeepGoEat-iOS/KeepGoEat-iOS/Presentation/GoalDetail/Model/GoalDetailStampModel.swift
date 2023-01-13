//
//  GoalDetailStampModel.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/03.
//

import UIKit

struct GoalDetailStampModel {
    let stampImage: UIImage
}

let moreSuccessStampDummy: GoalDetailStampModel = GoalDetailStampModel(stampImage: Const.Image.moreStampImage!)

let moreStaticStampDummy: GoalDetailStampModel = GoalDetailStampModel(stampImage: Const.Image.moreStaticStampImage!)

let moreEmptyStampDummy: GoalDetailStampModel = GoalDetailStampModel(stampImage: Const.Image.moreEmptyStampImage!)

let lessSuccessStampDummy: GoalDetailStampModel = GoalDetailStampModel(stampImage: Const.Image.lessStampImage!)

let lessStaticStampDummy: GoalDetailStampModel = GoalDetailStampModel(stampImage: Const.Image.lessStaticStampImage!)

let lessEmptyStampDummy: GoalDetailStampModel = GoalDetailStampModel(stampImage: Const.Image.lessEmptyStampImage!)
