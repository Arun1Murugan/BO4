//
//  ScreenA.swift
//  Task5
//
//  Created by Arun_Skyraan on 19/09/22.
//

import SwiftUI

struct ScreenA: View {
    
    @State var rollNumber : String = ""
    @State var name : String = ""
    @State var dob  = Date()
    @State var phoneNumber : String = ""
    @State var emailID : String = ""
    @State var address : String = ""
    
    var Controller = CoreDataController()
    
    
    var body: some View {
        
        ZStack {
            Color.mint
                .edgesIgnoringSafeArea(.all)
 
        VStack(spacing : 23) {
            Text ("WELCOME")
                .font(.title2)
                .bold()
                .foregroundColor(.primary)
            Text("Fill the details below")
                .font(.headline)
                .foregroundColor(.white)
            TextField("Roll number",text : $rollNumber)
                .foregroundColor(.blue)
                .frame(width: 350, height: 50)
                .background(.white)
                .cornerRadius(5)
                .shadow(color: .black, radius: 6)
                .keyboardType(.numberPad)
            TextField("Name",text : $name)
                .foregroundColor(.blue)
                .frame(width: 350, height: 50)
                .background(.white)
                .cornerRadius(5)
                .shadow(color: .black, radius: 6)
              
            
            DatePicker(selection: $dob, displayedComponents: .date, label: {
                Text("Date of birth ")
                
            })
                .foregroundColor(.gray)
                .opacity(0.6)
                .frame(width: 350, height: 50)
                .background(.white)
                .cornerRadius(5)
                .shadow(color: .black, radius: 6)

//            dob.timeIntervalSince1970
            TextField("Phone number",text : $phoneNumber)
                .foregroundColor(.blue)
                .frame(width: 350, height: 50)
                .background(.white)
                .cornerRadius(5)
                .shadow(color: .black, radius: 6)
                .keyboardType(.numberPad)
            TextField("Email id",text : $emailID)
                .foregroundColor(.blue)
                .frame(width: 350, height: 50)
                .background(.white)
                .cornerRadius(5)
                .shadow(color: .black, radius: 6)
            TextField("Address",text : $address)
                .foregroundColor(.blue)
                .frame(width: 350, height: 50)
                .background(.white)
                .cornerRadius(5)
                .shadow(color: .black, radius: 6)
            
            HStack(spacing : 20) {
                Button(action: {
                    
                    Controller.savaDetails(rollNumber: rollNumber, phoneNumber: phoneNumber, dob: dob.timeIntervalSince1970, address: address, emailID: emailID, name: name)
                    
                   
//                    print(type(of: Age))
                }, label: {
                    Text("SAVE")
                        .bold()
                        .foregroundColor(.white)
                })
                .frame(width: 120, height: 40)
                .background(.blue)
                .cornerRadius(10)
                .shadow(color: .white, radius: 10)
                
                
                NavigationLink(destination: {
                    ScreenB()
                }, label: {
                    Text("View")
                        .bold()
                        .foregroundColor(.white)
                })
                .frame(width: 120, height: 40)
                .background(.blue)
                .cornerRadius(10)
                .shadow(color: .white, radius: 10)
            }
        Spacer()
            }
      
        }
    }
}

struct ScreenA_Previews: PreviewProvider {
    static var previews: some View {
        ScreenA()
    }
}

