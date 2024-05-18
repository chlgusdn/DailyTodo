//
//  TagView.swift
//  DailyTodo
//
//  Created by NUNU:D on 5/18/24.
//

import UIKit

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
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(rootFlexContainerView)
        
        
        rootFlexContainerView.flex
            .justifyContent(.center)
            .alignItems(.center)
            .direction(.column)
            .define { flex in
            flex.addItem(tagLabel)
        }
        
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        rootFlexContainerView.pin.all()
        rootFlexContainerView.flex.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

@available(iOS 17.0, *)
#Preview("태그 화면", traits: .fixedLayout(width: 70, height: 30), body: {
    TagView()
})
