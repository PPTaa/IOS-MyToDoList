//
//  NewMyToDoView.swift
//  MyToDoList
//
//  Created by leejungchul on 2020/12/16.

//
import SwiftUI

struct NewMyToDoView: View {
    // ObservableObject의 published 된 변수들이 변화할 때 마다 뷰가 업데이트 되도록
    @ObservedObject var viewModel: NewMyToDoViewModel
    
    // swiftUI에서 일반적으로 view를 닫는 방법
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @ObservedObject private var keyboard = KeyboardResponder()
    
    
    @State private var title = ""
    
    private var isAddButtonDisabled: Bool {
        title.isEmpty
    }
    
    private var addButtonColor: Color {
        isAddButtonDisabled ? .gray : .blue
    }
    
    var body: some View {
        VStack{
            Spacer()
            TextField("Enter Name", text: $title)
            Spacer()
            HStack{
                Button(action: {
                    // 뷰를 닫음
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                })
                .padding(.vertical, 16)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.red)
                .cornerRadius(10)
                Button(action: {
                    if !self.isAddButtonDisabled {
                        self.viewModel.addNewMyToDo(title: self.title)
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }, label: {
                    Text("Add")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                })
                .padding(.vertical, 16)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(addButtonColor)
                .disabled(isAddButtonDisabled)
                .cornerRadius(10)
            }//hstack
        }//vstack
        .padding()
        .padding(.bottom, keyboard.currentHeight)
        .animation(.easeOut(duration: keyboard.duration))
    }
}

struct NewMyToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewMyToDoView(viewModel: NewMyToDoViewModel())
    }
}
