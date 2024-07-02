//
//  GraphView.swift
//  DailyTodo
//
//  Created by NUNU:D on 5/18/24.
//

import UIKit

/// 우선 순위 화면
public final class GraphView: UIView {
    
    /// FlexLayout에 사용될 컨테이너 화면
    private let rootFlexContainer = UIView()
    
    /// 우선순위를 표시할 리스트화면
    private var graphViewList:[UIView] = {
        return (0...2).map { index in
            var cellView = UILabel().then {
                $0.text = "⭐️"
                $0.font = UIFont.systemFont(ofSize: 10)
            }
            
            return cellView
        }
    }()
    
    /// 우선순위 갯수를 바인딩할 initalizer
    public init(count: Int) {
        super.init(frame: .zero)
        
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(rootFlexContainer)
        
        rootFlexContainer.flex
            .direction(.row)
            .padding(5)
            .define { flex in
                flex.addItem()
                    .direction(.row)
                    .define { flex in
                        graphViewList.forEach {
                            flex.addItem($0)
                                .width(20)
                        }
                    }
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

//MARK: - PreView
@available(iOS 17.0, *)
#Preview(traits: .fixedLayout(width: 300, height: 20), body: {
    GraphView()
})
