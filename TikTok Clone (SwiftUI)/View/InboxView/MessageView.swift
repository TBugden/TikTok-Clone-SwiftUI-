//
//  MessageView.swift
//  TikTok Clone (SwiftUI)
//
//  Created by Jesse Chan on 11/20/22.
//

import SwiftUI

struct MessageView: View {
    @Environment(\.dismiss) var dismiss
    @State var tabBarVisible = false
    
    @FocusState var focused
    @State var messageText = ""
    
    var body: some View {
        VStack(spacing: 0) {
            MessageViewHeader()
            ScrollView {
                LazyVStack {
                    ForEach(1...20, id: \.self) { message in
                        MessageCell(isSender: message % 2 == 0 || message < 3)
                    }
                }
            }
            .scrollDismissesKeyboard(.immediately)
            
            MessageTextField()
        }
        .foregroundColor(.white)
        .background(.black)
        .toolbar(.hidden, for: .navigationBar)
        .toolbar(tabBarVisible ? .visible : .hidden, for: .tabBar)
    }
    
    @ViewBuilder
    func MessageViewHeader()->some View {
        HStack {
            Button {
                tabBarVisible = true
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
            }
            .padding(.trailing)
            Circle()
                .padding(.vertical, 5)
            Button("Some Guy") {
                
            }
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "flag")
            }
            
            Button {
                
            } label: {
                Image(systemName: "ellipsis")
            }
            .padding(.leading)
            
            
        }
        .frame(height: 50)
        .padding(.horizontal)
        .fontWeight(.medium)
    }
    
    @ViewBuilder
    func MessageCell(isSender: Bool)->some View {
        HStack(alignment: .bottom) {
            if !isSender {
                Circle()
                    .frame(height: 35)
                    .padding(.bottom, 2.5)
            }
            
            Text("This is a message. Here's some more text!!!! See how it looks.")
                .padding()
                .background(isSender ? Color.teal : Color.customBackgroundColor)
                .cornerRadius(25)
            
        }
        .padding(isSender ? .leading : .trailing, UIScreen.main.bounds.width / 4)
    }
    
    @ViewBuilder
    func MessageTextField()->some View {
        HStack(alignment: .bottom) {
            TextField("Send a message...", text: $messageText, axis: .vertical)
                .padding(.horizontal)
                .padding(.vertical, 15)
                .frame(minHeight: 50)
                .background(Color.customBackgroundColor)
                .cornerRadius(25)
                
                .focused($focused)
            Button {
                
            } label: {
                Circle()
                    .foregroundColor(messageText == "" ? .gray : .red)
                    .frame(height: 50)
                    .overlay {
                        Image(systemName: "paperplane.fill")
                    }
            }
        }
        .padding(.top)
        .padding(.horizontal)
        .padding(.bottom, 5)
        .background(.black)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
