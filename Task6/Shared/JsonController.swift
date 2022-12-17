//
//  ClassStructureFile.swift
//  Task6
//
//  Created by Arun_Skyraan on 21/09/22.
//

import Foundation
import CoreData

struct MyDataModel1 : Hashable, Codable {
    var result : String
    var categoriesList : [MyDataModel1A]
}

struct MyDataModel1A : Hashable, Codable {
    var categoryId : String
    var categoryTitle : String
    var catgoryThumbURL : String
    var isFav : String
    var icon_rgb : String
    var categoryThumbUploadType : String
    var categoryIconUploadType : String
    //    var subcategory
}

struct MyModelA123 : Hashable, Codable {
    var result : String
    var booksList : String
}


struct MyDataModel2 : Hashable, Codable {
    var result : String
    var booksList : [MyDataModel2A]
}
struct MyDataModel2A : Hashable, Codable {
    var bookId : String
    var bookName : String
    var bookDescription : String
    var bookKeywords :  String
    var bookImage : String
    var version : String
    var isPrime : String
    var bookImageUploadType : String
}


class myJsonClass : ObservableObject {
   
   @Published var jsonData : [MyDataModel1A] = []
    @Published var jsonData12 : [String] = []
   @Published var jsonData2A : [MyDataModel2A] = []
    @Published var CoreDataEntity3C : String = ""
    func FetchUrl(CountryCode: String){
        
        let postData = NSMutableData(data: "categoryCountry=IN".data(using: String.Encoding.utf8)!)
    
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        let request = NSMutableURLRequest(url: NSURL(string: "https://bookmaddie.com/webservice/api/get_categories.json")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        request.httpMethod = "POST"
        request.httpBody = postData as Data
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in

            if let data = data {
                
                if let decodedResponse = try? JSONDecoder().decode(MyDataModel1.self, from: data) {

                    DispatchQueue.main.async {
                        self.jsonData = decodedResponse.categoriesList
                        for x in self.jsonData{
                            CoreDataController.controllerObject.savaDetails(categoryId: x.categoryId, categoryTitle: x.categoryTitle, catgoryThumbURL: x.catgoryThumbURL, isFav: x.isFav, icon_rgb: x.icon_rgb, categoryThumbUploadType: x.categoryThumbUploadType, categoryIconUploadType: x.categoryIconUploadType)
                        }
                    }
                    return
                }
                else
                {
                    print("json parse error")
                }
            }else{
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")}
            
        }.resume()
    }
    
    func fetchurl2(myImage : String = "0"){
//        print("bookId",bookid)
        let postData = NSMutableData(data: "LastId=\(myImage)".data(using: String.Encoding.utf8)!)
        //       let postData = NSMutableData(data: "categoryCountry=\(CountryCode)".data(using: String.Encoding.utf8)!)
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        let request = NSMutableURLRequest(url: NSURL(string : "https://bookmaddie.com/webservice/api/get_all_book_list.json")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        request.httpMethod = "POST"
        request.httpBody = postData as Data
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            print("URLSession")
        if let data = data {
                
        if let decodedResponse = try? JSONDecoder().decode(MyDataModel2.self, from: data) {
            
                    DispatchQueue.main.async {
                        self.jsonData2A  = decodedResponse.booksList
                        for y in self.jsonData2A{
                            CoreDataController.controllerObject.savaDetails2A(bookId: y.bookId, bookName: y.bookName, bookDescription: y.bookDescription, bookKeywords: y.bookKeywords, bookImage: y.bookImage, version: y.version, isPrime: y.isPrime, bookImageUploadType: y.bookImageUploadType)
                        }
                        
                    }
                    return
                }
                else
                {
                    print("json parse error")
                }
            }else{
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")}
            
        }.resume()
    }
    
    func FetchUrl1(catId: String){
        print("bookId",catId)
        let postData = NSMutableData(data: "bookCategory=\(catId)".data(using: String.Encoding.utf8)!)
        //       let postData = NSMutableData(data: "categoryCountry=\(CountryCode)".data(using: String.Encoding.utf8)!)
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        let request = NSMutableURLRequest(url: NSURL(string : "https://bookmaddie.com/webservice/api/get_books.json")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        request.httpMethod = "POST"
        request.httpBody = postData as Data
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            print("URLSession")
        if let data = data {
                
        if let decodedResponse = try? JSONDecoder().decode(MyModelA123.self, from: data) {
                    print("\(decodedResponse)")
            
                    DispatchQueue.main.async {
//                        self.jsonData12.removeAll()
                        self.jsonData12  = decodedResponse.booksList.split(separator: ",").map({"\($0)"})
                        CoreDataController.controllerObject.savaDetails123(catId: catId, bookList: decodedResponse.booksList)
                        self.checkData(catId: catId)
                        
                    }
                    return
                }
                else
                {
                    print("json parse error")
                }
            }else{
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")}
            
        }.resume()
    }
    
    func checkData(catId:String) {
        if CoreDataController.controllerObject.PredicateSingleBook(CatId: catId).count > 0{
            CoreDataEntity3C =  CoreDataController.controllerObject.PredicateSingleBook(CatId: catId)[0].bookList ?? ""
        }
        if CoreDataEntity3C == "" {
            
            FetchUrl1(catId: catId)
            
        }
    }
    
}

