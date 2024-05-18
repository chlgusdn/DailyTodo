//
//  UILayoutable.swift
//  DailyTodo
//
//  Created by NUNU:D on 5/18/24.
//

import Foundation

/**
 레이아웃 설정 프로토콜입니다.
 - description: UI 레이아웃 설정에 대한 프로토콜
```
 func setConstraint() {
    view.constrinat()
 }
 
 func setLayout() {
    view.addSubView(subView)
 }
 
 func setProperty() {
    view.backgroundColor = .white
 }
 
 // 각 함수를 부르지 않고 setUpUI를 이용하여 사용
 override func viewDidLoad() {
    super.viewDidLoad()
    setUpUI()
 }
```
 
 */
public protocol UILayoutable {
    /// UI Constraint setUp Method (제약조건 업데이트 메서드)
    func setConstraint()
    /// UI Property setUp Method (프로퍼티 세팅 메서드)
    func setProperty()
    ///UI Layout setUp Method (레이아웃 세팅 메서드)
    func setLayout()
//    /// UI 제약조건, 프로퍼티, 레이아웃을 한번에 실행할 메서드 입니다.
//    /// 보통 이 메서드를 이용합니다.
//    func setUpUI()
}


public extension UILayoutable {
    
    func setConstraint() {}
    
    func setProperty() {}
    
    func setLayout() {}
    
    func setUpUI() {
        setProperty()
        setLayout()
        setConstraint()
    }
}
