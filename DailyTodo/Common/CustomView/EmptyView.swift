//
//  EmptyView.swift
//  DailyTodo
//
//  Created by NUNU:D on 7/3/24.
//

import UIKit
/// 할일 목록이 없을 경우 보여질 화면입니다.
final class EmptyView: UIView {
    /// 클릭 이벤트를 적용할 뷰 화면
    private let makeTodoControlView = UIControl()
    
    /// 할일 생성 Prefix 레이블
    private let titleLabel = UILabel().then {
        $0.text = "할일을 만들어 볼까요 ?"
        $0.textAlignment = .center
        $0.font = FontDesign.title20blod
    }
    
    private let todoCreateLabel = UILabel().then {
        $0.text = "만들기"
        $0.font = FontDesign.content14bold
        $0.textColor = .white
        $0.textAlignment = .center
        $0.layer.cornerRadius = 16
        $0.layer.masksToBounds = true
        $0.backgroundColor = .main
    }
    
    private let rootFlexContainerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(rootFlexContainerView)
        
        rootFlexContainerView.flex
            .justifyContent(.center)
            .define { flex in
                /// Control 화면
                flex.addItem(makeTodoControlView)
                    .alignItems(.center)
                    .define { flex in
                        /// 제목 레이블
                        flex.addItem(titleLabel)
                            .marginBottom(10)
                        /// 만들기 레이블
                        flex.addItem(todoCreateLabel)
                            .size(
                                CGSize(
                                    width: 100,
                                    height: 30
                                )
                            )
                    }
            }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rootFlexContainerView.pin.all()
        rootFlexContainerView.flex.layout()
    }
}

//MARK: - Preview
@available(iOS 17.0, *)
#Preview("할일 카드 셀", traits: .fixedLayout(width: 414, height: 896), body: {
    EmptyView()
})
