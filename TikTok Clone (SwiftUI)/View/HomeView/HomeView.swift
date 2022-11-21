//
//  HomeView.swift
//  TikTok Clone (SwiftUI)
//
//  Created by Jesse Chan on 11/18/22.
//

import SwiftUI

struct HomeView: View {
    @State var tabSelection = 2
    
    @Namespace var nsHome
    
    let commentsHeight = UIScreen.main.bounds.height * 0.75
    
    var body: some View {
        ZStack {
            TabView(selection: $tabSelection) {
                TikTokView()
                    .tag(1)
                TikTokView()
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.keyboard)
            .edgesIgnoringSafeArea(.top)
            
            TopControls()
            
        }
        .foregroundColor(.white)
        
    }
    
    @ViewBuilder
    func TopControls()->some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "play.tv")
                }
                
                HStack {
                    Button("Following") {
                        withAnimation { tabSelection = 1 }
                    }
                    .overlay {
                        if tabSelection == 1 {
                            Rectangle()
                                .frame(width: 30, height: 3.5)
                                .offset(y: 17.5)
                                .matchedGeometryEffect(id: "homeTab", in: nsHome)
                        }
                    }
                    Button("For You") {
                        withAnimation { tabSelection = 2 }
                    }
                    .overlay {
                        if tabSelection == 2 {
                            Rectangle()
                                .frame(width: 30, height: 3.5)
                                .offset(y: 17.5)
                                .matchedGeometryEffect(id: "homeTab", in: nsHome)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .fontWeight(.semibold)
                .font(.subheadline)
                
                Button {
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                }
                
            }
            .padding(.horizontal, 25)
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
