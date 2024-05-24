//
//  CellConfigureable.swift
//  DailyTodo
//
//  Created by NUNU:D on 5/24/24.
//

import Foundation

/// Cell에 대한 identifier나 configure 메서드를 담은 프로토콜
public protocol CellConfigureable {
    associatedtype T: Decodable
    
    /// idenfier 값
    static var identifier: String { get }
    /// 셀 데이터 바인딩 함수
    func configure(data: T)
}

