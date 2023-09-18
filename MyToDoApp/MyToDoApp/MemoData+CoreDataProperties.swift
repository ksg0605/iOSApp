//
//  MemoData+CoreDataProperties.swift
//  MyToDoApp
//
//  Created by 김선규 on 2023/09/18.
//
//

import Foundation
import CoreData


extension MemoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemoData> {
        return NSFetchRequest<MemoData>(entityName: "MemoData")
    }

    @NSManaged public var memoText: String?
    @NSManaged public var date: Date?
    @NSManaged public var color: Int64

}

extension MemoData : Identifiable {

}
