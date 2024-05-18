//
//  TodoCollectionViewCell.swift
//  DailyTodo
//
//  Created by NUNU:D on 5/18/24.
//

import UIKit

public final class TodoCollectionViewCell: UICollectionViewCell {
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
        $0.text = "✏️ 일본어 공부하기"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
    }
    
    private let tagView = TagView()
    
    private let tagContainerStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 11
    }
    
    private let priorityLabel = UILabel().then {
        $0.text = "✨ 우선순위: 낮음"
        $0.font = UIFont.systemFont(ofSize: 10, weight: .heavy)
    }
    
    private let completeLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        $0.textColor = .transparentBlack
        $0.text = "완료했습니다"
        $0.textAlignment = .center
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(rootFlexContainer)
        addSubview(completeLabel)
        
        tagContainerStackView.addArrangedSubview(tagView)
        
        rootFlexContainer.flex.direction(.column)
            .justifyContent(.spaceEvenly)
            .padding(10)
            .define { flex in
                flex.addItem(titleLabel)
                flex.addItem(tagContainerStackView).height(16).width(40)
                flex.addItem(priorityLabel)
            }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        completeLabel.pin.all()
        rootFlexContainer.pin.all()
        rootFlexContainer.flex.layout()
    }
}
//MARK: - Preview
@available(iOS 17.0, *)
#Preview("할일 카드 셀", traits: .fixedLayout(width: 414, height: 80), body: {
    TodoCollectionViewCell()
})
