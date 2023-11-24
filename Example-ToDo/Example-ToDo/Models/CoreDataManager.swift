//
//  CoreDataManager.swift
//  Example-ToDo
//
//  Created by 김선규 on 11/23/23.
//

import UIKit
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    let modelName: String = "ToDoData"
    
    // MARK: - [READ]
    func getToDoListFromCoreData() -> [ToDoData] {
        var toDoList: [ToDoData] = []
        
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            let dateOrder = NSSortDescriptor(key: "date", ascending: false)
            request.sortDescriptors = [dateOrder]
            
            do {
                if let fetchedToDoList = try context.fetch(request) as? [ToDoData] {
                    toDoList = fetchedToDoList
                }
            } catch {
                print("가져오는것 실패")
            }
        }
        return toDoList
    }
    
    // MARK: - [Create]
    func saveToDoData(toDoText: String?, colorInt: Int64, completion: @escaping () -> Void) {
        
        if let context = context {
            if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
                if let toDoData = NSManagedObject(entity: entity, insertInto: context) as? ToDoData {
                    toDoData.memoText = toDoText
                    toDoData.date = Date()   
                    toDoData.color = colorInt
                    
                    if context.hasChanges {
                        do {
                            try context.save()
                            completion()
                        } catch {
                            print(error)
                            completion()
                        }
                    }
                }
            }
        }
    }
    
    
}
