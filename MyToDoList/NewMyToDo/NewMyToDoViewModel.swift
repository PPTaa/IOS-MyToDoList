//
//  NewMyToDoViewModel.swift
//  MyToDoList
//
//  Created by leejungchul on 2020/12/16.
//

import Foundation
import Combine

final class NewMyToDoViewModel: ObservableObject {
    var dataManager: DataManagerProtocol
    
    // 클래스 초기화시 dataManager를 상속받음
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
    }
}

protocol NewMyToDoViewModelProtocol {
    func addNewMyToDo(title: String)
}

// protocol 의 메소드를 상속받아 사용
extension NewMyToDoViewModel:NewMyToDoViewModelProtocol {
    func addNewMyToDo(title: String) {
//        let myToDo = MyToDo(id: UUID(), title: title, isCompleted: false)
//        dataManager.add(myToDo: myToDo)
        dataManager.addMyToDo(title: title)
    }
    
    
}
