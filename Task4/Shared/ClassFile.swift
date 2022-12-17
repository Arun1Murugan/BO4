//
//  ClassFile.swift
//  Task4
//
//  Created by Arun_Skyraan on 19/09/22.
//

import Foundation
class myClass : ObservableObject {
   
   @Published var obj : [subStructure] = []
   @Published var obj1 : [String] = []
    @Published var obj2 : [myStructure2A] = []
   
   func FetchUrl(CountryCode: String){
       let postData = NSMutableData(data: "categoryCountry=IN".data(using: String.Encoding.utf8)!)
       //       let postData = NSMutableData(data: "categoryCountry=\(CountryCode)".data(using: String.Encoding.utf8)!)
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
//           print("URLSession")
           if let data = data {
               
               //                           let jsonString = String(data: data, encoding: .utf8)
               //                            print(jsonString!)
               
               if let decodedResponse = try? JSONDecoder().decode(myStructure.self, from: data) {
//                   print("\(decodedResponse)")
                   DispatchQueue.main.async {
                       self.obj = decodedResponse.categoriesList
                       
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
   
   func FetchUrl1(bookId: String){
       print("bookId",bookId)
       let postData = NSMutableData(data: "bookCategory=\(bookId)".data(using: String.Encoding.utf8)!)
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
               
       if let decodedResponse = try? JSONDecoder().decode(myStructure1.self, from: data) {

           
                   DispatchQueue.main.async {
                       self.obj1.removeAll()
                       self.obj1  = decodedResponse.booksList.split(separator: ",").map({"\($0)"})
                       
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
    func fetchurl2(myImage : String){
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
                
        if let decodedResponse = try? JSONDecoder().decode(myStructure2.self, from: data) {
 //                   print("\(decodedResponse)")
            
                    DispatchQueue.main.async {
//                        self.obj1.removeAll()
                        self.obj2  = decodedResponse.booksList
                        
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
   
}
