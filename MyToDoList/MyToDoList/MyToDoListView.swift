//
//  MyToDoListView.swift
//  MyToDoList
//
//  Created by leejungchul on 2020/12/16.
//

import SwiftUI

struct MyToDoListView: View {
    // ObservableObject의 published 된 변수들이 변화할 때 마다 뷰가 업데이트 되도록
    @ObservedObject var viewModel = MyToDoListViewModel()
    
    var body: some View {
        NavigationView{
            List(viewModel.myToDos) { mytodo in
                Text(mytodo.title)
            }
            .navigationTitle(Text("MyTodo List"))
        }
        .onAppear{
            // view가 그려지기 시작할때 fetchMyToDos메소드를 호출
            self.viewModel.fetchMyToDos()
        }
    }
}

struct MyToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        
        var view = MyToDoListView()
        //mock데이터들을 view에 넣어줌
        view.viewModel = MyToDoListViewModel(dataManager: MockDataManager())
        return view
    }
}
