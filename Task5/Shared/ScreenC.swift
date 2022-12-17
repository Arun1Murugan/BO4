//
//  ScreenC.swift
//  Task5
//
//  Created by Arun_Skyraan on 20/09/22.
//

import SwiftUI

struct ScreenC: View {
    @State var Stdutet : MyStudent?
    var Controller = CoreDataController()
    
    var body: some View {
        VStack {
//            Text("\(Stdutet?.name ?? "")")
            ZStack {
                Color.cyan
                    .frame(width: 350, height: 380)
                    .opacity(0.4)
            HStack(spacing : 50) {
                let Age = Calendar.current.dateComponents([.year], from: Date(timeIntervalSince1970: Stdutet?.dob ?? 0.0) , to: Date())
                VStack(alignment : .leading, spacing : 30){
                   
                    Text("Name")
                    Text("ID")
                    Text("Age")
                    Text("Email")
                    Text("Address")
                    Text("Phone")
                }
                VStack(alignment : .leading, spacing : 30) {
                    Text(" : \(Stdutet?.name ?? "")")
                    Text(" : \(Stdutet?.rollNumber ?? "")")
                    Text(" : \(Age.year ?? 0) Yrs")
                    Text(" : \(Stdutet?.emailID ?? "".lowercased())")
                    Text(" : \(Stdutet?.address ?? "")")
                    Text(" : \(Stdutet?.phoneNumber ?? "")")
                }
            }
                
            }
            .cornerRadius(15)
            
            NavigationLink(destination: {
                
                ScreenD(Student: Stdutet!)
//
                
            }, label: {
                Text("Modify")
            })
            .foregroundColor(.white)
            .frame(width: 150, height: 50)
            .background(Color.blue)
//            .opacity(0.4)

        }
    }
}

struct ScreenC_Previews: PreviewProvider {
    static var previews: some View {
        ScreenC()
    }
}
