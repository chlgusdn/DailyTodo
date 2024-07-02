//
//  TagView.swift
//  DailyTodo
//
//  Created by NUNU:D on 5/18/24.
//

import UIKit

/// 할일 태그화면
public final class TagView: UIView {

    public let rootFlexContainerView = UIView().then {
        $0.backgroundColor = .main
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }
    
    public let tagLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 8, weight: .heavy)
        $0.text = "개인"
    }
    
    public init(color: UIColor) {
        super.init(frame: .zero)
        setUpUI()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        rootFlexContainerView.pin.size(CGSize(width: 40, height: 16))
        rootFlexContainerView.flex.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Private Method
private extension TagView {
    
    /// 뷰에 대한 UI를 설정해주는 함수
    func setUpUI() {
        addSubview(rootFlexContainerView)
        
        rootFlexContainerView.flex
            .justifyContent(.center)
            .alignItems(.center)
            .define { flex in
                flex.addItem(tagLabel)
            }
    }
    
}

// MARK: - PreView
@available(iOS 17.0, *)
#Preview("태그 화면", traits: .fixedLayout(width: 40, height: 16), body: {
    TagView()
})
