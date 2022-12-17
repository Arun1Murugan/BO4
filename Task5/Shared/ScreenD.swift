//
//  ScreenD.swift
//  Task5
//
//  Created by Arun_Skyraan on 20/09/22.
//

import SwiftUI

struct ScreenD: View {
    
    @State var rollNumber : String = ""
    @State var name : String = ""
    @State var dob  = Date()
    @State var phoneNumber : String = ""
    @State var emailID : String = ""
    @State var address : String = ""
    @State var isTapped : Bool = false
    
    @State var Student : MyStudent
    var Controller = CoreDataController()
    
    
    var body: some View {
        ZStack {
            Color.purple
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
        
        VStack(spacing : 25) {
            
            Text("Modify or Update the details")
                .font(.title2)
                .bold()
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
                    print(" Student.rollNumber", Student.rollNumber)
                    print(" rollNumber", rollNumber)
//                    print(" Student.name", Student.name)
//                    print(" Student.dob", Student.dob)
//                    print(" Student.emailID", Student.emailID)
//                    print(" Student.address", Student.address)
                    Student.rollNumber = rollNumber
                    Student.name = Student.name
                    Student.dob = dob.timeIntervalSince1970
                    Student.emailID = emailID
                    Student.address = address
                    Student.phoneNumber = phoneNumber
                    Controller.updateDetails()
                    self.isTapped.toggle()
                    
                }, label: {
                    Text("Modify")
                        .bold()
                        .foregroundColor(.white)
                })
                .frame(width: 120, height: 40)
                .background(.blue)
                .cornerRadius(10)
                .shadow(color: .white, radius: 10)
                
            
            }
            
        Spacer()
            }.alert("Are you sure want make the changes?", isPresented: $isTapped, actions: {
                HStack {
                    NavigationLink(destination: {
                        
                        ScreenA()
                       
                    }, label: {
                        Text("Modify")
                    })
                    Button(action: {
                        
                    }, label: {
                        Text("Cancel")
                    })
                }
            })
        }
    }
}

struct ScreenD_Previews: PreviewProvider {
    static var previews: some View {
        ScreenD(Student: MyStudent())
    }
}
