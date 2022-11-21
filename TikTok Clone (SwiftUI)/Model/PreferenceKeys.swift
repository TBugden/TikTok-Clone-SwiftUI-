//
//  PreferenceKeys.swift
//  TikTok Clone (SwiftUI)
//
//  Created by Jesse Chan on 11/19/22.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
