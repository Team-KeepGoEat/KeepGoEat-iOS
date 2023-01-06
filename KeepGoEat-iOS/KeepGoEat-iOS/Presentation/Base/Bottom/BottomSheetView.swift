//
//  BottomSheetView.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/04.
//

import UIKit

class BottomSheetView: UIView {
    
    // MARK: Component
    private let bottomSheetView: UIView = UIView().then {
        $0.backgroundColor = .white
        
        $0.layer.cornerRadius = 10
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setupGestureRecognizer()
        showBottomSheet()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BottomSheetView {
    private func setUI() {
        self.backgroundColor = .black.withAlphaComponent(0.5)
    }
    
    private func setLayout() {
        self.addSubview(
            bottomSheetView
        )
        
        bottomSheetView.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.top.equalTo(UIScreen.main.bounds.size.height)
        }
    }
    
    private func setupGestureRecognizer() {
        let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped(_: )))
        self.addGestureRecognizer(dimmedTap)
        self.isUserInteractionEnabled = true
    }
    
    private func showBottomSheet() {
        bottomSheetView.snp.updateConstraints {
            $0.top.equalToSuperview().inset(UIScreen.main.bounds.size.height - 325.adjusted)
        }

        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }

    private func hideBottomSheet() {
        bottomSheetView.snp.updateConstraints {
            $0.top.equalTo(UIScreen.main.bounds.size.height)
        }

        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            self.alpha = 0.0
            self.layoutIfNeeded()
        })
    }
    
    // UITapGestureRecognizer 연결 함수 부분
    @objc private func dimmedViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        hideBottomSheet()
    }
}
