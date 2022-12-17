//
//  Screen2.swift
//  Task4
//
//  Created by Arun_Skyraan on 17/09/22.
//

import SwiftUI

struct Screen2: View {
    
    @State var book : String
    @ObservedObject var myObject1 = myClass()
    @State var SArr : [String] = []
    @State var mySS : String
//    @State var myTT : String
    
    var body: some View {
        VStack {
        List {
            
            ForEach( myObject1.obj1, id : \.self){ index in
                
                NavigationLink(destination: {
                    Screen3(bookid: index)
                }, label: {
                
                Text("\(index)")
                    
                })
                
            }
            
       

        }
        .navigationTitle("\(book) Books")
        .onAppear(perform: {
//            StrArr(myStr: )
            myObject1.FetchUrl1(bookId: mySS)
//            SArr =  myObject1.obj1.split(separator: ",").map({"\($0)"})
        })
//            Text("\(book)")
    }
    }
    
    func StrArr(myStr : String) {
//        myObject1.FetchUrl1(bookId: "34")
//        FetchUrl1
        
        
    }
}

struct Screen2_Previews: PreviewProvider {
    static var previews: some View {
        Screen2(book: "Demo title", mySS: "14")
    }
}
