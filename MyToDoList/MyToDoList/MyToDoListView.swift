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
    
    @State private var isShowingAddNew = false
    
    //plus 버튼 만들어주는 view
    private var addNewButton: some View {
        Button(action: {
            self.isShowingAddNew.toggle()
        }, label: {
            Image(systemName: "plus")
        })
    }
    
    // 완료된 목록 표시
    private var showCompletedButton: some View {
        Button(action: {
            self.viewModel.showCompleted.toggle()
        }, label: {
            Image(systemName: self.viewModel.showCompleted ? "checkmark.circle.fill" : "checkmark.circle")
        })
    }
    
    var body: some View {
        NavigationView{
            List(viewModel.myToDos) { mytodo in
                Button(action: {
                    self.viewModel.toggleIsCompleted(for: mytodo)
                }, label: {
                    MyToDoRow(myToDo: mytodo)
                })
                
            }
            .navigationTitle(Text("MyTodo List"))
            .navigationBarItems(leading: showCompletedButton ,trailing: addNewButton)
        }
        .sheet(isPresented: $isShowingAddNew, onDismiss: {
            self.viewModel.fetchMyToDos()
        }){
            NewMyToDoView(viewModel: NewMyToDoViewModel())
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
