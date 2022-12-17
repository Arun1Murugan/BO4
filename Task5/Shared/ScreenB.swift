//
//  ScreenB.swift
//  Task5
//
//  Created by Arun_Skyraan on 19/09/22.
//

import SwiftUI

struct ScreenB: View {
    
    @State var EntityArray : [MyStudent] = []
    @State var isLongPressed : Bool = false
    var Controller = CoreDataController()
    @State var curr_Date = Date()
    @State var Stdutet : MyStudent?
    
    @State var colorArray : [Color] = [.red, .yellow, .blue, .green, .pink, .purple, .cyan, .indigo, .mint, .orange, .brown]
    
    var body: some View {
        ZStack {
            if EntityArray.count > 0 {
                List {
                    ForEach(EntityArray, id: \.self) { data in
                        NavigationLink(destination: {
                            ScreenC(Stdutet: data)
                        }, label: {
                        VStack{
                            let Age = Calendar.current.dateComponents([.year], from: Date(timeIntervalSince1970: data.dob) , to: Date())
                       
                                
                                HStack(spacing : 50) {
                                    VStack(alignment : .leading){
                                        Text("Name")
                                        Text("ID")
                                        Text("Age")
                                        Text("Email")
                                        Text("Address")
                                        Text("Phone")
                                    }
                                    VStack(alignment : .leading) {
                                        Text(" : \(data.name ?? "")")
                                        Text(" : \(data.rollNumber ?? "")")
                                        Text(" : \(Age.year ?? 0)")
                                        Text(" : \(data.emailID ?? "".lowercased())")
                                        Text(" : \(data.address ?? "")")
                                        Text(" : \(data.phoneNumber ?? "")")
                                    }
                                    
                                }
                           
                        }.onLongPressGesture(minimumDuration: 0.5) {
                            Stdutet = data
                            self.isLongPressed = true
                        }
                        })
                        .background(colorArray[Int.random(in: 0..<colorArray.count)])
                    }
//                    .listRowBackground( colorArray[Int.random(in: 0..<colorArray.count)])
                  
                    
                    .alert("Are you sure to delete this record?", isPresented: $isLongPressed) {
                        
                        HStack {
                            Button(action: {
                                EntityArray.removeAll()
                                if Stdutet != nil{
                                    Controller.deleteDetail(student: Stdutet!)
                                }
                                EntityArray =  Controller.getAllDetails()
                            }, label: {
                                Text("Delete")
                            })
                            .foregroundColor(.red)
                            Button(action: {
                                
                            }, label: {
                                Text("Cancel")
                            })
                        }
                        
                    }
                    
                }
//                .listStyle(.grouped)
               
                
            }else {
                Text("please wait, we are fetching the data.")
                    .onAppear(perform: {
                        DispatchQueue.main.async {
                            EntityArray =  Controller.getAllDetails()
                        }
                    })
            }
        }
    }
    //    func delete(index : IndexSet,item:MyStudent){
    //        EntityArray.remove(atOffsets: index)
    //    }
}

struct ScreenB_Previews: PreviewProvider {
    static var previews: some View {
        ScreenB()
    }
}
