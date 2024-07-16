//
//  ItemDetails.swift
//  IDine
//
//  Created by Vivek Shrivastava on 15/07/24.
//

import SwiftUI

struct ItemDetails: View {
    
    let item: MenuItem
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundStyle(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            
            Button("Place Order") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetails(item: MenuItem.example)
            .environmentObject(Order())
    }
}
