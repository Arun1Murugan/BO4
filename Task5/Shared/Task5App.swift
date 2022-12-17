//
//  Task5App.swift
//  Shared
//
//  Created by Arun_Skyraan on 19/09/22.
//

import SwiftUI

@main
struct Task5App: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
            ScreenA()
            }.navigationViewStyle(.stack)
        }
    }
}
