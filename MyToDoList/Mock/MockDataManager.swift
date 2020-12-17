//
//  MockDataManager.swift
//  MyToDoList
//
//  Created by leejungchul on 2020/12/16.
//

import Foundation

//테스트용 임시 데이터
class MockDataManager {
    private var myToDos = [MyToDo]()
    
    init(){
        myToDos = [
            MyToDo(id: UUID(), title: "title1", isCompleted: false),
            MyToDo(id: UUID(), title: "title2", isCompleted: false),
            MyToDo(id: UUID(), title: "title3", isCompleted: false),
            MyToDo(id: UUID(), title: "title4", isCompleted: true),
            MyToDo(id: UUID(), title: "title5", isCompleted: false),
            MyToDo(id: UUID(), title: "title6", isCompleted: false),
            MyToDo(id: UUID(), title: "title7", isCompleted: false),
            MyToDo(id: UUID(), title: "title8", isCompleted: false),
            MyToDo(id: UUID(), title: "title9", isCompleted: true),
            MyToDo(id: UUID(), title: "title10", isCompleted: true),
            MyToDo(id: UUID(), title: "title11", isCompleted: true),
            MyToDo(id: UUID(), title: "title12", isCompleted: false)
        ]
    }
}

extension MockDataManager: DataManagerProtocol {
    func addMyToDo(title: String) {
        let myToDo = MyToDo(title: title)
        myToDos.insert(myToDo, at: 0)
    }
    
//    func add(myToDo: MyToDo) {
//        myToDos.insert(myToDo, at: 0)
//    }
    
    func fetchMyToDoList(includingCompleted: Bool = false) -> [MyToDo] {
        includingCompleted ? myToDos : myToDos.filter { !$0.isCompleted }
    }
    func toggleIsCompleted(for myToDo: MyToDo) {
        if let index = myToDos.firstIndex(where: {$0.id == myToDo.id}) {
            myToDos[index].isCompleted.toggle()
        }
    }
}
