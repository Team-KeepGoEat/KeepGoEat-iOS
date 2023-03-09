//
//  CheckBoxButton.swift
//  KeepGoEat-iOS
//
//  Created by 정채은 on 2023/03/06.
//

import UIKit

import SnapKit
import Then

//TODO: label 부분을 탭해도 체크박스가 활성화되도록
class CheckBoxButton: UIButton {
    
    let checkedImage = Const.Image.icnCheckBoxOrange! as UIImage
    let uncheckedImage =  Const.Image.icnCheckBox! as UIImage
    
    var label = UILabel().then {
        $0.isUserInteractionEnabled = true
    }
    
    var isChecked: Bool = false {
        didSet {
            if isChecked {
                self.setImage(checkedImage, for: .normal)
                label.textColor = .orange600
                label.font = .system4Bold
            } else {
                self.setImage(uncheckedImage, for: .normal)
                label.textColor = .gray700
                label.font = .system4
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setAddTarget()
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setAddTarget() {
        self.addTarget(self, action:#selector(buttonTapped(sender:)), for: .touchUpInside)
        isChecked = false
//        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped))
        label.addGestureRecognizer(tapGesture)
    }
    
    private func setUI() {
        self.addSubview(label)
        label.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.snp.trailing).offset(4.adjusted)
        }
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        isChecked = !isChecked
//        self.buttonTapped(sender: self)
    }
    
    @objc func buttonTapped(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
