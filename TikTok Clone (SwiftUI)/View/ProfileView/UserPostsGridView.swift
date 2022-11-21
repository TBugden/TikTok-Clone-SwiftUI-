//
//  UserPostsGridView.swift
//  TikTok Clone (SwiftUI)
//
//  Created by Jesse Chan on 11/19/22.
//

import SwiftUI

struct UserPostsGridView: View {
    let columns = Array(Array(repeating: GridItem(.flexible(), spacing: 1), count: 3))
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 1) {
            ForEach(1...10, id: \.self) { tiktok in
                ProfileGridItem()
            }
        }
    }
    
    @ViewBuilder
    func ProfileGridItem()->some View {
        Rectangle()
            .aspectRatio(0.75, contentMode: .fit)
            .foregroundColor(.black)
            .overlay {
                VStack {
                    Spacer()
                    HStack {
                        Image(systemName: "arrowtriangle.right")
                        Text("73.3k")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.caption)
                    .fontWeight(.bold)
                }
                .padding(5)
                .foregroundColor(.white)
            }
    }
}

struct UserPostsGridView_Previews: PreviewProvider {
    static var previews: some View {
        UserPostsGridView()
    }
}
