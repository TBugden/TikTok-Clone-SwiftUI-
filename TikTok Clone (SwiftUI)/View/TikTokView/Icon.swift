//
//  Icon.swift
//  TikTok Clone (SwiftUI)
//
//  Created by Jesse Chan on 11/16/22.
//

import SwiftUI

struct Icon: View {
    var body: some View {
        ZStack {
            Image(systemName: "plus.rectangle.fill")
                .foregroundColor(.red)
                .offset(x: 5)
            Image(systemName: "plus.rectangle.fill")
                .foregroundColor(.blue)
                .offset(x: -5)
            Image(systemName: "plus.rectangle.fill")
                .background(.white)
        }
    }
}

struct Icon_Previews: PreviewProvider {
    static var previews: some View {
        Icon()
    }
}
