//
//  CommentView.swift
//  TikTok Clone (SwiftUI)
//
//  Created by Jesse Chan on 11/17/22.
//

import SwiftUI

struct CommentView: View {
    @State var isShowingReplies = false
    
    let comment: Comment
    let isReplyTo: String?
    
    var body: some View {
        VStack {
            let isReply = isReplyTo != nil
            
            HStack(alignment: .top) {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: isReply ? 25 : 35, height: isReply ? 25 : 35)
                    .padding(.top, 5)
                VStack(alignment: .leading, spacing: 7.5) {
                    HStack {
                        Text(comment.user)
                        if let replyToUser = isReplyTo {
                            Image(systemName: "arrowtriangle.right.fill")
                                .font(.system(size: 7.5))
                                .opacity(0.5)
                            Text(replyToUser)
                        }
                        Spacer()
                    }
                    Text(comment.text)
                        .font(.callout)
                        .fontWeight(.regular)
                    HStack(spacing: 15) {
                        Text("19h")
                        Text("Reply")
                        Spacer()
                        Label(String(comment.likes), systemImage: "heart")
                        Label("", systemImage: "hand.thumbsdown")
                    }
                    
                    .opacity(0.5)
                    
                    
                    if comment.replies.count > 0 {
                        if isShowingReplies {
                            ForEach(comment.replies) { reply in
                                CommentView(comment: reply, isReplyTo: comment.user)
                            }
                        } else if comment.replies.count > 0 && !isShowingReplies {
                            Button {
                                withAnimation {
                                    isShowingReplies = true
                                }
                            } label: {
                                HStack {
                                    Text("View \(comment.replies.count) replies")
                                    Image(systemName: "chevron.down")
                                }
                            }
                        }
                    }
                    
                }
            }
            .fontWeight(.semibold)
            .font(.caption)
            .padding(.vertical, 7.5)
            //            .padding(.leading, isReply ? 40 : 0)
            
           
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
            .background(.black)
            .foregroundColor(.white)
    }
}
