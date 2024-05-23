//
//  TagModel.swift
//  DailyTodo
//
//  Created by NUNU:D on 5/23/24.
//

import Foundation
import SwiftData
/// 태그  데이터
@Model
class TagModel {
    /// 태그 명
    @Attribute(.unique)
    var title: String
    /// 태그 색상
    var color: String
    
    init(title: String, color: String) {
        self.title = title
        self.color = color
    }
}
