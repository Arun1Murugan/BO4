//
//  Screen1.swift
//  Task4
//
//  Created by Arun_Skyraan on 17/09/22.
//

import SwiftUI

struct Screen1: View {
    
    @State var title : String
//    @State var bL : String
    
    var body: some View {
        Text("\(title)")
    }
}

struct Screen1_Previews: PreviewProvider {
    static var previews: some View {
        Screen1(title: "Demo Title")
    }
}
