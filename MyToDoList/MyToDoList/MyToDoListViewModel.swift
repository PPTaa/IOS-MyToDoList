//
//  MyToDoListViewModel.swift
//  MyToDoList
//
//  Created by leejungchul on 2020/12/16.
//

import Foundation
import Combine

// ObservableObject를 상속받아 뷰모델의 변화를 감지할 수 있도록 함
final class MyToDoListViewModel: ObservableObject {
    
    //이 두 변수중 어느것이라도 변화가 감지되면 뷰를 업데이트 시키도록 published를 사용
    @Published var myToDos = [MyToDo]()
    @Published var showCompleted = false {
        didSet {
            fetchMyToDos()
        }
    }
    
    var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
        fetchMyToDos()
    }
}

protocol MyToDoListViewModelProtocol {
    // get만을 사용하여 리스트를 가져올수만 있게 함
    var myToDos: [MyToDo] { get }
    // get, set을 모두 사용하여 완료된것을 토글할 수 있도록 함
    var showCompleted: Bool { get set }
    // todo리스트를 가져올 때 사용하는 함수
    func fetchMyToDos()
    // todo를 완료한 경우 마킹을 할 수 있도록 함
    func toggleIsCompleted(for myToDo: MyToDo)
}

// protocol을 준수할 수 있도록 extension을 제작(변수들은 제외하고)
extension MyToDoListViewModel: MyToDoListViewModelProtocol {
    func toggleIsCompleted(for myToDo: MyToDo) {
        dataManager.toggleIsCompleted(for: myToDo)
        fetchMyToDos()
    }
    
    func fetchMyToDos() {
        myToDos = dataManager.fetchMyToDoList(includingCompleted: showCompleted)
    }
}

// 뷰모델의 메소드들은 datamanager의 메소드 들과 비슷하기 때문에 dataManager가 필요없다고 생각될 수 있지만
// 가독성, 확장가능성, 이해가능성, 테스트용이성을 위해 필요하다.
// dataManager는 데이터 저장과 관련된 모든 응답과 관련된 일을 함
// viewModel은 view에서 모델이 필요한 부분만을 담당하게됨
 
