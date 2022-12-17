//
//  CoreDataController.swift
//  Task6
//
//  Created by Arun_Skyraan on 21/09/22.
//


import Foundation
import CoreData


class CoreDataController {
    
    static let controllerObject = CoreDataController()
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "MyDataModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
    func savaDetails(categoryId : String, categoryTitle : String, catgoryThumbURL : String , isFav : String, icon_rgb : String, categoryThumbUploadType : String, categoryIconUploadType : String ) {
        let data123 = MyDataModel1AEntity(context: persistentContainer.viewContext)
        
        data123.categoryId = categoryId
        data123.categoryTitle = categoryTitle
        data123.catgoryThumbURL = catgoryThumbURL
        data123.isFav = isFav
        data123.icon_rgb = isFav
        data123.categoryThumbUploadType = categoryThumbUploadType
        data123.categoryIconUploadType = categoryIconUploadType
   
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save. \(error)")
        }
    }
    
    func getAllDetails() -> [MyDataModel1AEntity] {
        let fetchRequest: NSFetchRequest<MyDataModel1AEntity> = MyDataModel1AEntity.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return[]
        }
    }
    func savaDetails2A(bookId : String, bookName : String, bookDescription : String, bookKeywords : String, bookImage : String, version : String, isPrime : String, bookImageUploadType : String) {
        
        let data2A = MyDataModel2BEntity(context: persistentContainer.viewContext)
        
        data2A.bookId = bookId
        data2A.bookName = bookName
        data2A.bookDescription = bookDescription
        data2A.bookKeywords = bookKeywords
        data2A.bookImage = bookImage
        data2A.version = version
        data2A.isPrime = isPrime
        data2A.bookImageUploadType = bookImageUploadType
   
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save. \(error)")
        }
    }
    
    func getAllDetails() -> [MyDataModel2BEntity] {
        let fetchRequest: NSFetchRequest<MyDataModel2BEntity> = MyDataModel2BEntity.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return[]
        }
    }
    
    func savaDetails123(catId : String, bookList : String) {
        
        let data123 = MyDataModel3CEntity(context: persistentContainer.viewContext)
        
        data123.catId = catId
        data123.bookList = bookList
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save. \(error)")
        }
    }
    
    func getAllDetailsC3() -> [MyDataModel3CEntity] {
        let fetchRequest: NSFetchRequest<MyDataModel3CEntity> = MyDataModel3CEntity.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return[]
        }
    }


    func PredicateSingleBook(CatId: String)->[MyDataModel3CEntity]{
        let fetchRequest: NSFetchRequest<MyDataModel3CEntity> = MyDataModel3CEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format:"catId == %@",CatId)
        do {
            let fetchedResults = try persistentContainer.viewContext.fetch(fetchRequest)
            return fetchedResults
        } catch {
            return[]
        }
    }

    func PredicateBook(BookID: String)->[MyDataModel2BEntity]{
        let fetchRequest: NSFetchRequest<MyDataModel2BEntity> = MyDataModel2BEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format:"bookId == %@",BookID)
        do {
            let fetchedResults = try persistentContainer.viewContext.fetch(fetchRequest)
            return fetchedResults
        } catch {
            return[]
        }
    }

    
}
