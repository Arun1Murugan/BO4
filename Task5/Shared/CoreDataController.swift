//
//  CoreDataController.swift
//  Task5
//
//  Created by Arun_Skyraan on 19/09/22.
//

import Foundation
import CoreData


class CoreDataController {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "MyDataModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
    func savaDetails(rollNumber : String, phoneNumber : String, dob : Double, address : String, emailID : String , name : String) {
        let student = MyStudent(context: persistentContainer.viewContext)
        
        student.rollNumber = rollNumber
        student.name = name
        student.dob = dob
        student.phoneNumber = phoneNumber
        student.emailID = emailID
        student.address = address

        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save. \(error)")
        }
    }
    
    func getAllDetails() -> [MyStudent] {
        let fetchRequest: NSFetchRequest<MyStudent> = MyStudent.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return[]
        }
    }
    func deleteDetail(student: MyStudent) {
        persistentContainer.viewContext.delete(student)
        do {
            try persistentContainer.viewContext.save()
        } catch{
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error)")
        }
    }
    
    func updateDetails() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
    }


}
