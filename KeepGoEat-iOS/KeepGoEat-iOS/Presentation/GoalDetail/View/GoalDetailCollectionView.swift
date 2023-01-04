//
//  GoalDetailCollectionView.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/04.
//

import UIKit

class GoalDetailCollectionView: UICollectionView {
    
    // MARK: - Variables
    
    private let goalType: GoalType
    
    private final let inset: UIEdgeInsets = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    
    private final let lineSpacing: CGFloat = 2
    
    private final let itemSpacing: CGFloat = 2
    
    private final let cellHeight: CGFloat = 46
    
    init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout, goalType: GoalType) {
        self.goalType = goalType
        super.init(frame: frame, collectionViewLayout: layout)
        self.delegate = self
        self.dataSource = self
        register()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GoalDetailCollectionView {
    private func setUI() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 8
        self.isScrollEnabled = false
    }
    
    private func register() {
        self.register(GoalDetailCollectionViewCell.self, forCellWithReuseIdentifier: GoalDetailCollectionViewCell.identifier)
    }
}

extension GoalDetailCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 46.adjusted, height: 46.adjusted)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return inset
    }
}

extension GoalDetailCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 35
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch goalType {
        case .less:
            guard let stampCell = collectionView.dequeueReusableCell(withReuseIdentifier: GoalDetailCollectionViewCell.identifier, for: indexPath) as? GoalDetailCollectionViewCell else { return UICollectionViewCell() }
            stampCell.backgroundColor = .green200Opacity3
            stampCell.dataBind(model: lessSuccessStampDummy)
            return stampCell
        case .more:
            guard let stampCell = collectionView.dequeueReusableCell(withReuseIdentifier: GoalDetailCollectionViewCell.identifier, for: indexPath) as? GoalDetailCollectionViewCell else { return UICollectionViewCell() }
            stampCell.backgroundColor = .orange200Opacity3
            stampCell.dataBind(model: moreSuccessStampDummy)
            return stampCell
        }
    }
}
