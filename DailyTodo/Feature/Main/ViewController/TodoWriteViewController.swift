//
//  TodoWriteViewController.swift
//  DailyTodo
//
//  Created by NUNU:D on 7/1/24.
//

import UIKit

/// 할 일 작성화면
public final class TodoWriteViewController: BaseViewController {
    
    /// 제목 Prefix 레이블
    private let titleLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.text = "제목"
    }
    
    /// 제못을 적을 수 있는 텍스트 필드
    private let titleTextField = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.placeholder = "제목을 입력해주세요"
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.backgroundColor = .contentBackground
        $0.addLeftPadding(padding: 10)
    }
    
    /// 내용 Prefix 레이블
    private let contentLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.text = "내용"
    }
    
    /// 내용을 적을 수 있는 텍스트 뷰
    private let contentTextView = UITextView().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.backgroundColor = .contentBackground
    }
    
    /// 태그 Prefix 레이블
    private let tagLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.text = "태그"
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(rootFlexContainer)
        
        rootFlexContainer.flex
            .direction(.column)
            .padding(10)
            .define { flex in
                /// 제목 화면
                flex.addItem()
                    .marginBottom(20)
                    .define {
                        $0.addItem(titleLabel)
                            .marginBottom(10)
                        $0.addItem(titleTextField)
                            .height(35)
                    }
                
                /// 내용 화면
                flex.addItem()
                    .marginBottom(20)
                    .define {
                        $0.addItem(contentLabel)
                            .marginBottom(10)
                        $0.addItem(contentTextView)
                            .height(200)
                    }
                
                /// 태그 화면
                flex.addItem()
                    .define {
                        $0.addItem(tagLabel)
                    }
            }
        
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        rootFlexContainer.pin.all(view.pin.safeArea)
        rootFlexContainer.flex.layout()
    }
    
}

//MARK: - Preview
@available(iOS 17.0, *)
#Preview("할일 작성 화면", traits: .portrait, body: {
    TodoWriteViewController()
})

