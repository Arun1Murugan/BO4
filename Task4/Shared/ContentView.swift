//
//  ContentView.swift
//  Shared
//
//  Created by Arun_Skyraan on 17/09/22.
//

import SwiftUI

struct myStructure : Hashable, Codable {
    var result : String
    var categoriesList : [subStructure]
}

struct subStructure : Hashable, Codable {
    var categoryId : String
    var categoryTitle : String
    var catgoryThumbURL : String
    var isFav : String
    //    var categoryIconImage
    var icon_rgb : String
    var categoryThumbUploadType : String
    var categoryIconUploadType : String
    //    var subcategory
}

struct myStructure1 : Hashable, Codable {
    var result : String
    var booksList : String
}

struct myStructure2 : Hashable, Codable {
    var result : String
    var booksList : [myStructure2A]
}
struct myStructure2A : Hashable, Codable {
    var bookId : String
    var bookName : String
    var bookDescription : String
    var BookPublisherName : String
//    var bookAuthorName : String
//    var BookPublished : String
    var bookKeywords :  String
    var bookImage : String
//    var geoblock : String
    var version : String
    var isPrime : String
    var bookImageUploadType : String
}

struct ContentView: View {
    @ObservedObject var myObject = myClass()
    
    var body: some View {
        VStack {
            
            List() {
                
                ForEach (myObject.obj, id : \.self){ index in
                    NavigationLink(destination: {
                        Screen2(book: index.categoryTitle, mySS: index.categoryId)
                    }, label: {
                        Text("\(index.categoryId)")
                            .font(.headline)
                            .bold()
                        //            .padding()
                    })
                    
                }
            }
            .navigationTitle("Category id : ")
            .listStyle(.grouped)
            //        Text("")
            //    .padding()
            .onAppear(perform: {
                myObject.FetchUrl(CountryCode: "IN")
                
            })
            //    .onDisappear(perform: {
            //        print("DisAppear Called")
            //    })
            
        }.padding()
        Spacer()
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
