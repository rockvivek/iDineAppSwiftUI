//
//  ContentView.swift
//  IDine
//
//  Created by Vivek Shrivastava on 15/07/24.
//

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            NavigationLink(value: item) {
                                ItemRow(item: item)
                            }
                            .navigationDestination(for: MenuItem.self) { item in
                                ItemDetails(item: item)
                            }
                           
                        }
                    }
                }
                .navigationTitle("Menu")
                .listStyle(.grouped)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
