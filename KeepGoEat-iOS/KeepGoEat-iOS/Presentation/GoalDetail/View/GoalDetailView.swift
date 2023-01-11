//
//  GoalDetailView.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/02.
//

import UIKit

import Then

enum GoalType: String {
    case more
    case less
}

class GoalDetailView: UIView {
    
    // MARK: - Variables
    var goalType: GoalType {
        didSet {
            setUI()
        }
    }

    // MARK: Component
    private let headerView: HeaderView = HeaderView()
    
    private let headerViewTitle: UILabel = UILabel().then {
        $0.font = .system4Bold
        $0.text = Const.String.myGoal
    }
    
    public let editGoalButton: UIButton = UIButton().then {
        $0.setImage(Const.Image.icnPen, for: .normal)
    }
    
    public let saveGoalButton: UIButton = UIButton().then {
        $0.setImage(Const.Image.icnBox, for: .normal)
    }
    
    private let goalTypeImageView: UIImageView = UIImageView()
    
    let goalTitleLabel: UILabel = UILabel().then {
        $0.text = "하루 1끼 이상 야채 더 먹기"
        $0.font = .system2Bold
        $0.textColor = .gray800
    }
    
    private let goalStatsWrapView: UIView = UIView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray300.cgColor
        $0.layer.cornerRadius = 8
    }
    
    let previousGoalStatsView: GoalStatsView = GoalStatsView(frame: CGRect())
    
    let presentGoalStatsView: GoalStatsView = GoalStatsView(frame: CGRect())
    
    private let goalStatsBorderLineView: UIView = UIView().then {
        $0.backgroundColor = .gray300
    }
    
    private lazy var goalStatsStackView: UIStackView = UIStackView(arrangedSubviews: [
        previousGoalStatsView,
        goalStatsBorderLineView,
        presentGoalStatsView
    ]).then {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
    }
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
    }
    
    lazy var goalStatsCollectionView: GoalDetailCollectionView = GoalDetailCollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout, goalType: goalType)
    
    let dimmedView: UIView = UIView().then {
        $0.backgroundColor = .black.withAlphaComponent(0.5)
        $0.isHidden = true
    }
    
    let bottomSheetView: BottomSheetView = BottomSheetView()
    
    lazy var saveBottomSheetView: SaveBottomSheetView = SaveBottomSheetView(frame: CGRect(), goalType: goalType)
    
    let deleteBottomSheetView: DeleteBottomSheetView = DeleteBottomSheetView().then {
        $0.isHidden = true
    }
    
    override init(frame: CGRect) {
        self.goalType = .more
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GoalDetailView {
    private func setUI() {
        self.backgroundColor = .white
        
        switch goalType {
        case .more:
            goalTypeImageView.image = Const.Image.moreTag
            previousGoalStatsView.goalStatsTitleLabel.text = Const.String.previousMoreGoalStatsTitle
            presentGoalStatsView.goalStatsTitleLabel.text = Const.String.presentMoreGoalStatsTitle
            presentGoalStatsView.goalStatsCountLabel.textColor = .orange600
            saveBottomSheetView.bottomSheetSaveButton.backgroundColor = .orange600
            deleteBottomSheetView.cancelButton.backgroundColor = .orange600
            goalStatsCollectionView.goalType = goalType
            saveBottomSheetView.goalType = goalType
            
        case .less:
            goalTypeImageView.image = Const.Image.lessTag
            previousGoalStatsView.goalStatsTitleLabel.text = Const.String.previousLessGoalStatsTitle
            presentGoalStatsView.goalStatsTitleLabel.text = Const.String.presentLessGoalStatsTitle
            presentGoalStatsView.goalStatsCountLabel.textColor = .green600
            saveBottomSheetView.bottomSheetSaveButton.backgroundColor = .green600
            deleteBottomSheetView.cancelButton.backgroundColor = .green600
            goalStatsCollectionView.goalType = goalType
            saveBottomSheetView.goalType = goalType
        }
    }
    
    private func setLayout() {
        self.addSubviews(
            headerView,
            goalTypeImageView,
            goalTitleLabel,
            goalStatsWrapView,
            goalStatsCollectionView,
            dimmedView,
            bottomSheetView
        )
        
        headerView.addSubviews(
            editGoalButton,
            headerViewTitle,
            saveGoalButton
        )
        
        bottomSheetView.addSubviews(
            saveBottomSheetView,
            deleteBottomSheetView
        )
        
        goalStatsWrapView.addSubview(
            goalStatsStackView
        )
        
        headerView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(48.adjusted)
        }
        
        headerViewTitle.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        editGoalButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(saveGoalButton.snp.leading).inset(-4.adjusted)
            $0.width.height.equalTo(32.adjusted)
        }
        
        saveGoalButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16.adjusted)
            $0.width.height.equalTo(32.adjusted)
        }
        
        goalTypeImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(72.adjusted)
            $0.leading.equalTo(self.safeAreaLayoutGuide).inset(20.adjustedWidth)
        }
        
        goalTitleLabel.snp.makeConstraints {
            $0.top.equalTo(goalTypeImageView.snp.bottom).inset(-8.adjusted)
            $0.leading.equalTo(self.safeAreaLayoutGuide).inset(20.adjustedWidth)
        }
        
        goalStatsBorderLineView.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(80.adjusted)
        }
        
        goalStatsWrapView.snp.makeConstraints {
            $0.top.equalTo(goalTitleLabel.snp.bottom).inset(-12.adjusted)
            $0.directionalHorizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(20.adjustedWidth)
            $0.height.equalTo(152.adjusted)
        }
        
        goalStatsStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(240.adjusted)
            $0.height.equalTo(80.adjusted)
        }
        
        goalStatsCollectionView.snp.makeConstraints {
            $0.top.equalTo(goalStatsWrapView.snp.bottom).inset(-16.adjustedHeight)
            $0.width.equalTo(336.adjusted)
            $0.height.equalTo(240.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        bottomSheetView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(UIScreen.main.bounds.height)
            $0.height.equalTo(325.adjusted)
            $0.directionalHorizontalEdges.equalToSuperview()
        }
        
        dimmedView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        saveBottomSheetView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        deleteBottomSheetView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
