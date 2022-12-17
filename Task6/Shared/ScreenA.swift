//
//  ScreenA.swift
//  Task6
//
//  Created by Arun_Skyraan on 21/09/22.
//

import SwiftUI

struct ScreenA: View {
    
    var controllerObject1 = CoreDataController()
    var jsonObject1 = myJsonClass()
    @State var CoreDataEntity2B : [MyDataModel2BEntity] = []
    
    var body: some View {
        ScrollView {
        VStack {
            ForEach(CoreDataEntity2B, id: \.self) { index in
                ImageWithURL("\(index.bookImage!.replacingOccurrences(of: "http", with: "https"))")
                    .frame(width: 150, height: 150)
                    .clipShape(Rectangle())
                
                Text("\(index.bookName ?? "")")
            }
       
        }
        .onAppear(perform: {
            checkData()
        })
    }
    }
    
    func checkData() {
        
        CoreDataEntity2B =  CoreDataController.controllerObject.getAllDetails()
        
        if CoreDataEntity2B.count == 0 {
            
            jsonObject1.fetchurl2(myImage: "IN")
            
        }
    }
}

struct ScreenA_Previews: PreviewProvider {
    static var previews: some View {
        ScreenA()
    }
}
