//
//  BottomSheetView.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/04.
//

import UIKit

class BottomSheetViewController: UIViewController {
    // MARK: Component
    private let dimmedBackView: UIView = UIView().then {
        $0.backgroundColor = .black
    }
    
    private let bottomSheetView: UIView = UIView().then {
        $0.backgroundColor = .white
        
        $0.layer.cornerRadius = 10
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setupGestureRecognizer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showBottomSheet()
    }
}

extension BottomSheetViewController {
    private func setUI() {
        view.backgroundColor = .white
    }

    private func setLayout() {
        view.addSubviews(
            dimmedBackView,
            bottomSheetView
        )

        dimmedBackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        bottomSheetView.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(UIScreen.main.bounds.size.height)
            $0.bottom.equalToSuperview()
        }
    }

    private func showBottomSheet() {
        bottomSheetView.snp.updateConstraints {
            $0.top.equalToSuperview().inset(UIScreen.main.bounds.size.height - 325.adjusted)
        }

        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            self.dimmedBackView.alpha = 0.5
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    private func hideBottomSheet() {
        bottomSheetView.snp.updateConstraints {
            $0.top.equalTo(UIScreen.main.bounds.size.height)
        }

        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            self.dimmedBackView.alpha = 0.0
            self.view.layoutIfNeeded()
        })
    }

    private func setupGestureRecognizer() {
        let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped(_: )))
        dimmedBackView.addGestureRecognizer(dimmedTap)
        dimmedBackView.isUserInteractionEnabled = true
    }

    // UITapGestureRecognizer 연결 함수 부분
    @objc private func dimmedViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        hideBottomSheet()
    }
}
