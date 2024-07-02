//
//  TodoCollectionViewCell.swift
//  DailyTodo
//
//  Created by NUNU:D on 5/18/24.
//

import UIKit

/// 할일 목록 콜렉션 뷰
public final class TodoCollectionViewCell: UICollectionViewCell, CellConfigureable {
    public typealias T = String
    
    public static var identifier: String {
        return String(describing: self)
    }
    
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
    
    private let priorityGraph = GraphView()
    
    private let completeLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        $0.textColor = .transparentBlack
        $0.text = "완료했습니다"
        $0.textAlignment = .center
    }
    
    // FIXME: 변경예정
    private var count: Int {
        return 4
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(rootFlexContainer)
        addSubview(completeLabel)
        
        rootFlexContainer.flex.direction(.column)
            .justifyContent(.center)
            .padding(10)
            .define { flex in
                
                flex.addItem()
                    .justifyContent(.spaceBetween)
                    .direction(.row)
                    .marginBottom(12)
                    .define { flex in
                        flex.addItem(titleLabel)
                        flex.addItem(priorityGraph)
                    }
                
                flex.addItem()
                    .direction(.row)
                    .define { flex in
                        (1...self.count).forEach { _ in
                            let tagView = TagView()
                            flex.addItem(tagView)
                                .marginRight(4)
                                .width(40)
                        }
                    }
            }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel
            .pin
            .topLeft(to: rootFlexContainer.anchor.topLeft)
        
        priorityGraph
            .pin
            .topRight(to: rootFlexContainer.anchor.topRight)
            .height(20)
        
        completeLabel.pin.all()
        rootFlexContainer.pin.all()
        rootFlexContainer.flex.layout()
    }
    
    public func configure(data: String) {
        
    }
    
}
//MARK: - Preview
@available(iOS 17.0, *)
#Preview("할일 카드 셀", traits: .fixedLayout(width: 414, height: 100), body: {
    TodoCollectionViewCell()
})
