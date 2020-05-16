//
//  TaskRepository.swift
//  firebase-to-dos
//
//  Created by Erik Miller on 5/12/20.
//  Copyright © 2020 Erik Miller. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore
import Firebase

class TaskRepository: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var tasks = [Task]()
    
    init(){
        loadData()
    }
    
    func loadData(){
        let userID = Auth.auth().currentUser?.uid
        
        db.collection("tasks")
            .whereField("userID", isEqualTo: userID)
            .order(by: "creationDate")
            .addSnapshotListener{(querySnapshot, Error) in
            if let querySnapshot = querySnapshot {
                self.tasks = querySnapshot.documents.compactMap { document in
                    do{
                        let x = try? document.data(as: Task.self)
                        return x
                    }
//                    catch {
//                        print(error)
//                    }
//                    return nil
                }
            }
        }
    }
    
    func addTask(_ task: Task) {
        do {
        var addedTask = task
            let userID = Auth.auth().currentUser?.uid
            addedTask.userID = userID
       let _ = try db.collection("tasks").addDocument(from: addedTask)
    }
   catch{
    fatalError("unable to encode task: \(error.localizedDescription)")
    }
}
    func updateTask(_ task: Task) {
        if let taskID = task.id {
            do{
                
            let _ = try db.collection("tasks").document(taskID).setData(from: task)
            }
            catch{
                fatalError("Unable to update task")
            }
        }
    }
    
    
}
