//
//  APITestApp.swift
//  APITest
//
//  Created by Subham Dhakal on 6/3/24.
//

import SwiftUI
import SwiftData

@available(iOS 17, *)
@main
struct APITestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: DataItem.self)
    }
}
