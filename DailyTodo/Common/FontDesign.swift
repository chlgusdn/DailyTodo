//
//  FontDesign.swift
//  DailyTodo
//
//  Created by NUNU:D on 7/3/24.
//

import UIKit

/// DailyTodo 프로젝트에서 사용될 폰트 리스트 enum
public enum FontDesign {
    /// 제목타입, 글씨크기: 20, 볼드체 적용 폰트
    static let title20blod = UIFont.boldSystemFont(ofSize: 20)
    
    /// 제목타입, 글씨크기: 30, heavy체 적용 폰트
    static let title30heavy = UIFont.systemFont(ofSize: 30, weight: .heavy)
    
    /// 부 제목 타입, 글씨크기: 14, heavy체 적용 폰트
    static let subTitle14heavy = UIFont.systemFont(ofSize: 14, weight: .heavy)
    
    /// 내용 타입, 글씨크기: 10, heavy체 적용 폰트
    static let content10heavy = UIFont.systemFont(ofSize: 10, weight: .heavy)
    
    /// 내용 타입, 글씨크기: 14, 볼드체 적용 폰트
    static let content14bold = UIFont.boldSystemFont(ofSize: 14)
    
    /// 내용 타입, 글씨크기: 20, heavy체 적용 폰트
    static let content20heavy = UIFont.systemFont(ofSize: 20, weight: .heavy)
    
    /// 내용 타입, 글씨크기: 14 일반적인 시스템 폰트 적용
    static let content14general = UIFont.systemFont(ofSize: 14)
    
    /// 내용 타입, 글씨크기: 50, heavy체 적용 폰트
    static let content50heavy = UIFont.systemFont(ofSize: 50, weight: .heavy)
    
    /// 내용타입, 글씨크기: 8, heavy체 적용 폰트
    static let content8heavy = UIFont.systemFont(ofSize: 8, weight: .heavy)
    
    /// 내용타입, 글씨크기: 10, 일반적인 시스템 폰트 적용
    static let content10general = UIFont.systemFont(ofSize: 10)
}
