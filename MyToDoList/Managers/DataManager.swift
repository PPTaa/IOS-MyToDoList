//
//  DataManager.swift
//  MyToDoList
//
//  Created by leejungchul on 2020/12/16.
//

import Foundation

class DataManager {
    static let shared: DataManagerProtocol = DataManager()
    private var myToDos = [MyToDo]()
    private init(){ }
}

protocol DataManagerProtocol {
    // 모든 리스트 가져오기
    func fetchMyToDoList(includingCompleted : Bool) -> [MyToDo]
    // 새로운 Todo추가하기
    func add (myToDo: MyToDo)
    // 완료 여부 표시의 작업구현
    func toggleIsCompleted (for myToDo: MyToDo)
}

extension DataManagerProtocol {
    // 기본값을 false로 하여 메서드를 구현
    func fetchMyToDoList(includingCompleted: Bool = false) -> [MyToDo] {
        fetchMyToDoList(includingCompleted: includingCompleted)
    }
}

extension DataManager: DataManagerProtocol {
    func fetchMyToDoList(includingCompleted: Bool = false) -> [MyToDo] {
        includingCompleted ? myToDos : myToDos.filter{!$0.isCompleted}
    }
    
    func add(myToDo: MyToDo) {
        myToDos.insert(myToDo, at: 0)
    }
    func toggleIsCompleted(for myToDo: MyToDo) {
        if let index = myToDos.firstIndex(where: {$0.id == myToDo.id}){
            myToDos[index].isCompleted.toggle()
        }
    }
}
