//
//  ContentView.swift
//  TikTok Clone (SwiftUI)
//
//  Created by Jesse Chan on 11/16/22.
//

import SwiftUI

struct TikTokView: View {
    @ObservedObject var viewModel = TikTokViewModel()
    @State var isShowingComments = false
    @State var selectedIndex = 0
    
    var body: some View {
        ZStack {
            VideoView()
        }
        .foregroundColor(.white)
        .ignoresSafeArea(.keyboard)
        .sheet(isPresented: $isShowingComments) {
            CommentsView()
                .presentationDetents([.height(UIScreen.main.bounds.height * 0.75)])
        }
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
                        
                    }
                    Button("For You") {
                        
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
    
    @ViewBuilder
    func VideoView()->some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            TabView {
                ForEach(DummyPhoto.photos, id: \.id) { tiktok in
                    tiktok.photo
                        .resizable().clipped()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width)
                        .clipped()
                        .overlay {
                            TikTokControls(commentsButtonAction: {isShowingComments = true})
                                .padding(.bottom)
                        }
                        .rotationEffect(.init(degrees: -90))
                        .ignoresSafeArea(.all, edges: .top)
                        
                    
                }
            }
            .rotationEffect(.init(degrees: 90))
            .frame(width: size.height)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(width: size.width)
        }
        .ignoresSafeArea(.all, edges: .top)
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TikTokView()
    }
}
