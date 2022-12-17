//
//  ScreenBCA.swift
//  Task6
//
//  Created by Arun_Skyraan on 22/09/22.
//

import SwiftUI

struct ScreenBCA: View {
 
    var ControllerObject2 = CoreDataController()
    @ObservedObject var jsonObject2 = myJsonClass()
    @State var CoreDataEntity3C : [MyDataModel3CEntity] = []
    @State var Ctid : String
    var body: some View {
        VStack {
            ScrollView{
            ForEach(jsonObject2.CoreDataEntity3C.split(separator: ","), id: \.self) { index in
                
//                NavigationLink(destination: {
//                    ScreenA()
//                }, label: {
                let book = CoreDataController.controllerObject.PredicateBook(BookID: "\(index)")
//                Text("\(String(index))")
//                })
                ForEach(book,id:\.self){
                    item in
                    ImageWithURL(item.bookImage!.replacingOccurrences(of: "http", with: "https"))
                        .frame(width: 150, height: 150)
                }
            }
        }
        }
      
        .onAppear(perform: {
            jsonObject2.checkData(catId: Ctid)
        })
    }
    
}

struct ScreenBCA_Previews: PreviewProvider {
    static var previews: some View {
        ScreenBCA( Ctid: "34")
    }
}
