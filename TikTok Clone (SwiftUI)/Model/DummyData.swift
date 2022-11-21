//
//  DummyData.swift
//  TikTok Clone (SwiftUI)
//
//  Created by Jesse Chan on 11/16/22.
//

import SwiftUI

struct DummyPhoto: Identifiable {
    let id = UUID()
    let photo: Image
}

extension DummyPhoto {
    static let photos: [DummyPhoto] = [
            DummyPhoto(photo: Image("cloudy")),
            DummyPhoto(photo: Image("river")),
            DummyPhoto(photo: Image("mountain")),
            DummyPhoto(photo: Image("purpleSky")),
            DummyPhoto(photo: Image("sandDunes")),
            DummyPhoto(photo: Image("snowy")),
        ]
}
