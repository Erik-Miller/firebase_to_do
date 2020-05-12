//
//  Task.swift
//  firebase-to-dos
//
//  Created by Erik Miller on 5/10/20.
//  Copyright © 2020 Erik Miller. All rights reserved.
//

import Foundation

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
}

#if DEBUG

let testDataTasks = [
    Task(title: "Task 1", completed: true ),
    Task(title: "Task 2", completed: true ),
    Task(title: "Task 3", completed: false ),
    Task(title: "Task 4", completed: false )
]
#endif

