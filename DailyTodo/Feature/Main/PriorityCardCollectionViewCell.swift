//
//  PriorityCardCollectionViewCell.swift
//  DailyTodo
//
//  Created by NUNU:D on 5/18/24.
//

import UIKit

public final class PriorityCardCollectionViewCell: UICollectionViewCell {
    
    private let rootFlexContainer = UIView().then {
        $0.layer.cornerRadius = 16
        $0.layer.shadowOpacity = 0.2
        $0.layer.shadowColor = UIColor.black.cgColor // 색깔
        $0.layer.shadowRadius = 3 // 반경
        $0.layer.shadowOffset = CGSize(width: 0, height: 1)
        $0.layer.masksToBounds = false
        $0.backgroundColor = .white
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "일본어 공부하기"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
    }
    
    private let tagView = TagView()
    
    private let tagContainerStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 11
    }
    
    private let reminderLabel = UILabel().then {
        $0.text = "⏰ 오전 12시 30분"
        $0.font = UIFont.systemFont(ofSize: 10, weight: .heavy)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(rootFlexContainer)
        
        tagContainerStackView.addArrangedSubview(tagView)
        
        rootFlexContainer.flex.direction(.column)
            .justifyContent(.spaceEvenly)
            .padding(10)
            .define { flex in
                flex.addItem(titleLabel)
                flex.addItem(tagContainerStackView).height(16)
                flex.addItem(reminderLabel)
            }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        rootFlexContainer.pin.all()
        rootFlexContainer.flex.layout()
    }
    
}


//MARK: - Preview
@available(iOS 17.0, *)
#Preview("우선 순위 카드 셀", traits: .fixedLayout(width: 200, height: 100), body: {
    PriorityCardCollectionViewCell()
})
