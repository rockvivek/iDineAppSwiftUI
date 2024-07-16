//
//  IDineApp.swift
//  IDine
//
//  Created by Vivek Shrivastava on 15/07/24.
//

import SwiftUI

@main
struct IDineApp: App {
    
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
