//
//  TodoModel.swift
//  DailyTodo
//
//  Created by NUNU:D on 5/23/24.
//

import Foundation
import SwiftData

/// Todo  데이터
@Model
class TodoModel {
    /// 제목
    @Attribute(.unique)
    var title: String
    /// 내용
    var content: String
    /// 리마인드 날짜
    var remiderDate: Date
    /// 우선순위
    var priority: Int
    /// 완료여부
    var isComplete: Bool
    
    /// 태그 리스트
    @Relationship(deleteRule: .cascade)
    var tagList: [TagModel]? = []
    
    init(title: String, content: String, remiderDate: Date, priority: Int, tagList: [TagModel]? = nil, isComplete: Bool) {
        self.title = title
        self.content = content
        self.remiderDate = remiderDate
        self.priority = priority
        self.tagList = tagList
        self.isComplete = isComplete
    }
}
