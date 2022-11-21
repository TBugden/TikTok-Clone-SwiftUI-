//
//  CommentsView.swift
//  TikTok Clone (SwiftUI)
//
//  Created by Jesse Chan on 11/16/22.
//

import SwiftUI

struct Comment: Identifiable, Hashable {
    let id = UUID().uuidString
    let user: String
    let text: String
    let date: Date
    let likes: Int
    var replies: [Comment]
    
    var liked: Bool = false
    var disliked: Bool = false
    var showingReplies: Bool = false
}

var replies = [
    Comment(user: "WOWzers", text: "don't be so mean. she's just living her life. how would you feel if everyone judged u", date: Date(), likes: 13, replies: []),
    Comment(user: "coldone", text: "... my what?", date: Date(), likes: 4, replies: [])
]
var comments = [
    Comment(user: "DaisyChain", text: "Oh my...", date: Date(), likes: 95, replies: replies),
    Comment(user: "meohmy", text: "This is a longer Comment. Ignore my grammer mistakes. no ragerts", date: Date(), likes: 2, replies: [])
]

struct CommentsView: View {
    @Environment(\.dismiss) var dismiss
    @State var userText = ""
    @FocusState var focused
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ZStack {
                    Text("\(comments.map { $0.replies.count + 1 }.reduce(0, +)) comments")
                        .font(.callout)
                        .fontWeight(.semibold)
                    HStack {
                        Spacer()
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                        }
                        .padding()
                    }
                }
                ScrollView {
                    LazyVStack {
                        ForEach(comments, id: \.id) { comment in
                            CommentView(comment: comment, isReplyTo: nil)
                        }
                    }
                    .padding(.leading, 10)
                }
                
                
            }
            .background(Color("customBackgroundColor"))
        .foregroundColor(.white)
            CommentTextFieldView(userText: $userText)
//            VStack {
//                Rectangle()
//                    .foregroundColor(.black)
//                    .opacity(focused ? 0.51 : 0)
//                    .onTapGesture {
//                        focused = false
//                    }
//                Rectangle()
//                    .frame(height: 50)
//                    .foregroundColor(.brown)
//                    .overlay {
//                        TextField("...", text: $userText)
//                            .focused($focused)
//                    }
//            }
//            VStack {
//                Rectangle()
//                    .foregroundColor(.black)
//                    .opacity(focused ? 0.51 : 0)
//                    .onTapGesture {
//                        focused = false
//                    }
//                UserTextField()
//                    .background(Color("customBackgroundColor"))
//            }
            
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("test") {
                    
                }
            }
           
        }
    }
    
    @ViewBuilder
    func UserTextField()->some View {
        TextField("Add comment...", text: $userText)
            .padding()
            .background(Color.gray)
            .cornerRadius(25)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .focused($focused)
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
            .background(.black)
            .foregroundColor(.white)
    }
}
