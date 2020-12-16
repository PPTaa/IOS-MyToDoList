//
//  MyToDo.swift
//  MyToDoList
//
//  Created by leejungchul on 2020/12/16.
//

import Foundation

struct MyToDo: Identifiable {
    // 유저의 고유 식별번호를 부여
    var id = UUID()
    var title: String
    var isCompleted = false
}
