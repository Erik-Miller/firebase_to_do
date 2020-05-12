//
//  TaskListView.swift
//  firebase-to-dos
//
//  Created by Erik Miller on 5/10/20.
//  Copyright © 2020 Erik Miller. All rights reserved.
//

import SwiftUI


struct TaskListView: View {

    
    @ObservedObject var taskListVM = TaskListViewModel()
    
    let tasks = testDataTasks

    @State private var presentAddNewItem = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                List{
                ForEach(taskListVM.taskCellViewModels) { taskCellVM in
                    TaskCell(taskCellVM: taskCellVM)
                    }
                    
                    if presentAddNewItem{
                        TaskCell(taskCellVM: TaskCellViewModel(task: Task(title: "", completed: false)))
                    }
                    
                }
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Button(action: {self.presentAddNewItem.toggle() }) {
                        Text("Add New Task")
                    }
                }
            }
        .navigationBarTitle("Tasks")
            .padding()
        }
    }
}



struct TaskCell: View {
    @ObservedObject var taskCellVM: TaskCellViewModel
    
    var body: some View {
        HStack {
            Image(systemName: taskCellVM.task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
            TextField("Enter the title", text: $taskCellVM.task.title)
            Text(taskCellVM.task.title)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
