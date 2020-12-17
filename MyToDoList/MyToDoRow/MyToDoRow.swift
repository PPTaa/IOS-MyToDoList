//
//  MyToDoRow.swift
//  MyToDoList
//
//  Created by leejungchul on 2020/12/17.
//

import SwiftUI

struct MyToDoRow: View {
    
    var myToDo: MyToDo
    
    var body: some View {
        HStack{
            Image(systemName: myToDo.isCompleted ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(myToDo.isCompleted ? .blue : .black)
            Text(myToDo.title)
            Spacer()
        }
    }
}

struct MyToDoRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            MyToDoRow(myToDo: MyToDo(title: "complete no Test"))
            MyToDoRow(myToDo: MyToDo(title: "complete ok Test", isCompleted: true))
        }
        .previewLayout(.fixed(width: 300, height: 44))
    }
}
