//
//  UITextField+Ext.swift
//  DailyTodo
//
//  Created by NUNU:D on 7/2/24.
//

import UIKit

/// 텍스트 필드 관련 Extension
public extension UITextField {
    
    /// 텍스트 필드 왼쪽  마진 추가 함수
    /// - Parameter padding: 마진 크기
    func addLeftPadding(padding: CGFloat) {
        let view = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: padding,
                height: self.bounds.height
            )
        )
        
        self.leftViewMode = .always
        self.leftView = view
    }
}
