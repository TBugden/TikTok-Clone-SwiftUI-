//
//  ProfileView.swift
//  TikTok Clone (SwiftUI)
//
//  Created by Jesse Chan on 11/19/22.
//

import SwiftUI

struct ProfileView: View {
    @State var selectedTab = 1
    @State var profileScrollDisabled = false
    @State var tabScrollDisabled = true
    
    let screensize = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            ProfileHeader()
            
            GeometryReader { p in
                
                ScrollView {
                    
                    ProfileDetails()
                    ProfileContentView(tabSelection: $selectedTab, tabScrollViewHeight: p.size.height - 45)
                        .frame(width: p.size.width, height: p.size.height)
                }
                .onAppear {
                    print("Screensize height: \(screensize.height)")
                    print("Proxy height: \(p.size.height)")
                }
            }
        }
        .background(Color.customBackgroundColor)
        .foregroundColor(.white)
    }
    
    @ViewBuilder
    func ProfileHeader()->some View {
        HStack {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "person.badge.plus")
                }
                .frame(width: 30)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Button {
                
            } label: {
                HStack {
                    Text("Some Guy")
                    Image(systemName: "chevron.down")
                        .frame(width: 10)
                }
                .offset(x: 10)
            }
            .frame(maxWidth: .infinity)
            
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "shoeprints.fill")
                }
                .frame(width: 30)
                Button {
                    
                } label: {
                    Image(systemName: "line.3.horizontal")
                }
                .frame(width: 30)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.horizontal)
        .fontWeight(.medium)
    }
    
    @ViewBuilder
    func ProfileDetails()->some View {
        VStack(spacing: 15) {
            ProfilePhoto()
            UserStats()
            ProfileControls()
        }
    }
    
    @ViewBuilder
    func ProfilePhoto()->some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(.gray)
                    .padding(2.5)
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.linearGradient(colors: [.blue, .teal], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .background(Color.white.cornerRadius(.infinity))
                                .padding(0.25)
                                .overlay {
                                    Circle()
                                        .stroke(style: StrokeStyle(lineWidth: 3))
                                        .foregroundColor(Color.customBackgroundColor)
                                    
                                }
                            
                        }
                    }
                }
            }
            .frame(width:100, height: 100)
            Text("@current_user")
                .lineLimit(1)
        }
    }
    
    @ViewBuilder
    func UserStats()->some View {
        HStack(spacing: 40) {
            ForEach(1...3, id: \.self) { stat in
                let title: String = {
                    switch stat {
                    case 1: return "Following"
                    case 2: return "Followers"
                    default: return "Like"
                    }
                }()
                
                VStack {
                    Text("35")
                    Text(title)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .fontWeight(.semibold)
            }
        }
    }
    
    @ViewBuilder
    func ProfileControls()->some View {
        VStack(spacing: 15) {
            HStack {
                Button("Edit Profile") {
                    
                }
                .frame(height: 50)
                .padding(.horizontal, 50)
                .background(
                    Color.gray.opacity(0.25)
                        .cornerRadius(5)
                )
                Button("⏷") {
                    
                }
                .frame(width: 50, height: 50)
                
                .background(
                    Color.gray.opacity(0.25)
                        .cornerRadius(5)
                )
                .aspectRatio(1.0, contentMode: .fit)
            }
            Button {
                
            } label: {
                HStack(spacing: 2.5) {
                    Image(systemName: "plus")
                        .font(.system(size: 7.5))
                    Text("Add bio")
                        .font(.caption)
                }
                .padding(.vertical, 3)
                .padding(.horizontal, 7.5)
                .background(
                    Color.gray
                        .opacity(0.25)
                )
                .cornerRadius(2.5)
            }

        }
        .font(.callout)
        .fontWeight(.medium)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
