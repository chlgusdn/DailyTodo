//
//  PriorityCardCollectionViewCell.swift
//  DailyTodo
//
//  Created by NUNU:D on 5/18/24.
//

import UIKit

/// 우선순위가 지정되어있는 콜렉션 뷰에 대한 셀
public final class PriorityCardCollectionViewCell: UICollectionViewCell, CellConfigureable {
    
    public typealias T = String
    
    public static var identifier: String {
        return String(describing: self)
    }
    
    /// 서브 뷰를 담을 컨테이너 뷰
    private let rootFlexContainer = UIView().then {
        $0.layer.cornerRadius = 16
        $0.layer.shadowOpacity = 0.2
        $0.layer.shadowColor = UIColor.black.cgColor // 색깔
        $0.layer.shadowRadius = 3 // 반경
        $0.layer.shadowOffset = CGSize(width: 0, height: 1)
        $0.layer.masksToBounds = false
        $0.backgroundColor = .white
    }
    
    /// 할일 제목 레이블
    private let titleLabel = UILabel().then {
        $0.text = "일본어 공부하기"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
    }
    
    /// 태그 화면
    private let tagView = TagView()
    
    /// 리마인더 레이블
    private let reminderLabel = UILabel().then {
        $0.text = "⏰ 오전 12시 30분"
        $0.font = UIFont.systemFont(ofSize: 10, weight: .heavy)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(rootFlexContainer)
        
        rootFlexContainer.flex
            .direction(.column)
            .justifyContent(.spaceEvenly)
            .padding(10)
            .define { flex in
                flex.addItem(titleLabel)
                flex.addItem()
                    .direction(.row)
                    .define { flex in
                        (1...3).forEach { _ in
                            let tagView = TagView()
                            flex.addItem(tagView)
                                .marginRight(4)
                                .width(40)
                        }
                    }
                
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
    
    
    
    /// - Description 셀에대한 데이터 바인딩 함수
    /// - Parameter data: 셀 데이터
    public func configure(data: String) {
        
    }
}


//MARK: - Preview
@available(iOS 17.0, *)
#Preview("우선 순위 카드 셀", traits: .fixedLayout(width: 200, height: 100), body: {
    PriorityCardCollectionViewCell()
})
