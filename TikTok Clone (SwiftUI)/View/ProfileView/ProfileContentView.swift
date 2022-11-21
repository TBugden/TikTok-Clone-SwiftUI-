//
//  ProfileContentView.swift
//  TikTok Clone (SwiftUI)
//
//  Created by Jesse Chan on 11/19/22.
//

import SwiftUI

struct ProfileContentView: View {
    @Binding var tabSelection: Int
    @Namespace var ns
    
    let tabScrollViewHeight: CGFloat?
    
    var body: some View {
        LazyVStack(spacing: 0) {
            TabButtons()
                .frame(height: 45)
            
            TabView(selection: $tabSelection) {
                
                ScrollView {
                    UserPostsGridView()
                }
                .tag(1)
                .scrollDisabled(true)
                
                ScrollView {
                    UserPostsGridView()
                }
                .tag(2)
                .scrollDisabled(true)
                
                ScrollView {
                    UserPostsGridView()
                }
                .tag(3)
                .frame(maxHeight: .infinity, alignment: .top)
                
                ScrollView {
                    UserPostsGridView()
                }
                .tag(4)
                .frame(maxHeight: .infinity, alignment: .top)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: tabScrollViewHeight)
        }
    }
    
    @ViewBuilder
    func TabButtons()->some View {
        HStack {
            ForEach(1...4, id: \.self) { tabItem in
                VStack {
                    TabItemView(tabId: tabItem)
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 5)
                        .overlay {
                            if tabItem == tabSelection {
                                Rectangle()
                                    .frame(height: 1.5)
                                    .padding(.horizontal)
                                    .padding(.vertical, 5)
                                    .matchedGeometryEffect(id: "tabButtonUnderline", in: ns)
                                    .offset(y: 12.5)
                            }
                        }
                }
            }
        }
        .padding(.top, 15)
        .padding(.bottom, 5)
    }
    
    @ViewBuilder
    func TabItemView(tabId: Int)->some View {
        let imageName: String = {
            switch tabId {
            case 1: return "rectangle.grid.3x2.fill"
            case 2: return "lock"
            case 3: return "bookmark"
            case 4: return "heart"
            default: return "heart"
            }
        }()
        Button {
            withAnimation {
                tabSelection = tabId
            }
        } label: {
            Image(systemName: imageName)
        }
    }
}

struct ProfileContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileContentView(tabSelection: .constant(1), tabScrollViewHeight: 700)
    }
}
