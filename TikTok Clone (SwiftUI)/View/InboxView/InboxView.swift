//
//  InboxView.swift
//  TikTok Clone (SwiftUI)
//
//  Created by Jesse Chan on 11/18/22.
//

import SwiftUI

struct InboxView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                InboxHeader()
                ScrollView {
                    NowGrid()
                    Divider()
                    Activities()
                    Messages()
                }
            }
            .foregroundColor(.white)
            .background(.black)
            .font(.system(size: 13))
        }
    }
    
    @ViewBuilder
    func InboxHeader()->some View {
        HStack(spacing: 0) {
            Button("Inbox") {
                
            }
            .fontWeight(.semibold)
            .font(.body)
            .frame(maxWidth: .infinity)
            .padding(.leading, 50)
            
            Button {
                
            } label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .padding(7.5)
                    .frame(width: 35, height: 35)
                    .fontWeight(.bold)
            }
            
            .padding(.trailing, 10)
        }
    }
    
    @ViewBuilder
    func NowGrid()->some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.flexible())], spacing: 15) {
                NowGridItem(available: false, isUser: true)
                ForEach(1...10, id: \.self) { user in
                    NowGridItem(available: user == 1 || user == 2)
                }
            }
            .frame(height: 100)
            .padding(.horizontal)
        }
        
    }
    
    @ViewBuilder
    func NowGridItem(available: Bool, isUser: Bool = false)->some View {
        let colors: [Color] = available ? [.blue, .teal] : [.clear]
        
        VStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 2))
                .frame(width: 70, height: 70)
                .foregroundStyle(LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay {
                    ZStack {
                        Circle()
                            .foregroundColor(.gray)
                            .padding(2.5)
                        if isUser {
                            HStack {
                                Spacer()
                                VStack {
                                    Spacer()
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "plus.circle.fill")
                                            .resizable()
                                            .frame(width: 22.5, height: 22.5)
                                            .foregroundStyle(.linearGradient(colors: [.blue, .teal], startPoint: .topLeading, endPoint: .bottomTrailing))
                                            .background(Color.white.cornerRadius(.infinity))
                                            .padding(0.25)
                                            .overlay {
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 3))
                                                    .foregroundColor(.black)
                                                
                                            }
                                            
                                    }
                                }
                            }
                        }
                    }
                }
            Text("person_1dsflajfdsfhk")
                .font(.caption)
                .frame(maxWidth: 75)
                .lineLimit(1)
        }
    }
    
    @ViewBuilder
    func Activities()->some View {
        LazyVStack {
            Text("Activities")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.body)
                .fontWeight(.medium)
                .padding()
            
            ForEach(1...2, id: \.self) { activity in
                ActivityItem()
                Divider()
                    .padding(.leading, 75)
            }
        }
    }
    
    @ViewBuilder
    func ActivityItem()->some View {
        HStack {
            Circle()
                .frame(width: 50, height: 50)
            Text("That Guy, who you may know, is on TikTok as that_guy7. 4h")
                .font(.system(size: 13))
            Spacer()
            Button {
                
            } label: {
                Text("Follow")
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    .background(.red)
                    .fontWeight(.medium)
                    .cornerRadius(2.5)
            }
            .padding(.leading)

        }
        .padding(.horizontal)
        .padding(.leading, 7.5)
    }
    
    @ViewBuilder
    func Messages()->some View {
        LazyVStack {
            Text("Messages")
                .frame(maxWidth: .infinity, alignment: .leading)
                .fontWeight(.medium)
                .font(.body)
                .padding()
            ForEach(1...15, id: \.self) { message in
                NavigationLink(destination: MessageView()) {
                    MessageItem()
                }
                Divider()
                    .padding(.leading, 75)
            }
        }
        
    }
    
    @ViewBuilder
    func MessageItem()->some View {
        HStack {
            Circle()
                .frame(width: 50, height: 50)
                .padding(.trailing, 5)
            VStack(alignment: .leading, spacing: 2.5) {
                Text("That Guy")
                    .fontWeight(.medium)
                    .font(.system(size: 16))
                HStack(spacing: 2.5) {
                    Image(systemName: "arrow.up.backward.circle")
                        .fontWeight(.bold)
                        .opacity(0.5)
                    Text("You shared a video")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .foregroundColor(.gray)
            }
            
            Spacer()
            VStack(alignment: .trailing, spacing: 5) {
                Text("5:38 PM")
                    .foregroundColor(.gray)
                    .opacity(0.75)
                Text("1")
                    .padding(.horizontal, 10)
                    .background(.red)
                    .cornerRadius(.infinity)
                    .fontWeight(.semibold)
                    .font(.caption)
            }
        }
        .padding(.horizontal)
        .padding(.leading, 7.5)
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
    }
}
