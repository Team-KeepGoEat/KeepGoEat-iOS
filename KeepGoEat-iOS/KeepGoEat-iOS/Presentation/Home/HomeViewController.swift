//
//  HomeViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    
    // MARK: - Variables
    // MARK: Component
    private let homeCheerView = HomeCheerView()

    // MARK: - Function
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
    }
    
    // MARK: Layout Helpers
    private func setUI() {
        view.backgroundColor = .gray700
    }
    private func setLayout() {
        view.addSubviews(
            homeCheerView
        )
        homeCheerView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: Preview
struct ViewControllerPreView: PreviewProvider {
    static var previews: some View {
        HomeViewController().toPreview()
    }
}
