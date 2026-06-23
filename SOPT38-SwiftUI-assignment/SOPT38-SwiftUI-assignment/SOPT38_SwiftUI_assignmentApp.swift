//
//  SOPT38_SwiftUI_assignmentApp.swift
//  SOPT38-SwiftUI-assignment
//
//  Created by Seoyoung Lee on 5/29/26.
//

import SwiftUI

@main
struct SOPT38_SwiftUI_assignmentApp: App {
    @State private var isLoggedIn = false

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                ContentView()
            } else {
                WelcomeView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}
