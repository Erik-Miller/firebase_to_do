//
//  TaskListViewModel.swift
//  firebase-to-dos
//
//  Created by Erik Miller on 5/10/20.
//  Copyright © 2020 Erik Miller. All rights reserved.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
@Published var taskCellViewModels = [TaskCellViewModel]()

private var cancellables = Set<AnyCancellable>()

init() {
    self.taskCellViewModels = testDataTasks.map { task in
      TaskCellViewModel(task: task)
    }
}
}
