//
//  ItemRow.swift
//  IDine
//
//  Created by Vivek Shrivastava on 15/07/24.
//

import SwiftUI

struct ItemRow: View {
    
    var item: MenuItem
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 2))
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
            Spacer()
            ForEach(item.restrictions, id: \.self) { restriction in
                RistrictionView(restriction: restriction)
                
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}

struct RistrictionView: View {
    
    var restriction: String
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    var body: some View {
        Text(restriction)
            .frame(width: 25, height: 17)
            .font(.caption)
            .fontWeight(.black)
            .padding(5)
            .background(colors[restriction, default: .black])
            .clipShape(Circle())
            .foregroundColor(.white)
    }
}
