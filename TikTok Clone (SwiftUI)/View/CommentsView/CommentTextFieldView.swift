//
//  CommentTextFieldView.swift
//  TikTok Clone (SwiftUI)
//
//  Created by Jesse Chan on 11/17/22.
//

import SwiftUI

struct CommentTextFieldView: View {
    let emoji = ["🙂","😀","😅","🥰","🤩","😘","🥲","🤪"]
    
    @FocusState var focused
    
    @Binding var userText: String
    @State var isShowingSendButton = false
    
    var body: some View {
        VStack(spacing: 10) {
//            Spacer()
            Rectangle()
                .foregroundColor(.black)
                .opacity(focused ? 0.51 : 0)
                .onTapGesture {
                    focused = false
                }
//            Group {
                HStack {
                    ForEach(emoji, id: \.self) { emoji in
                        Text(emoji)
                            .frame(maxWidth: .infinity)
                            .font(.system(size: 30))
                    }
                }
                HStack {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                    TextField("Add comment...", text: $userText, axis: .vertical)
                        .padding(.vertical, 13.5)
                        .padding(.horizontal, 15)
                        .padding(.trailing, 35)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(25)
                        .focused($focused)
                        .overlay {
                            if userText != "" {
                                VStack {
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        Button {
                                            
                                        } label: {
                                            Image(systemName: "arrow.up.circle.fill")
                                                .resizable()
                                                .frame(width: isShowingSendButton ? 30 : 0, height: isShowingSendButton ? 30 : 0)
                                                .aspectRatio(contentMode: .fill)
                                                .foregroundColor(.red)
                                                .background(Color.white.cornerRadius(.infinity))
                                            
                                            //                                            .fontWeight(.black)
                                            //                                            .font(.system(size: isShowingSendButton ? 15 : 0))
                                            //                                            .padding(6.5)
                                            //                                            .background(
                                            //                                                Circle()
                                            //                                                    .foregroundColor(.red)
                                            //                                            )
                                        }
                                        .padding(.trailing, 10)
                                    }
                                    .onAppear {
                                        withAnimation(.linear(duration: 0.1)) {
                                            isShowingSendButton = true
                                        }
                                    }
                                    .onDisappear {
                                        isShowingSendButton = false
                                    }
                                }
                                .padding(.bottom, 10)
                            }
                        }
                }
                .padding(.bottom, 10)
                .padding(.horizontal, 5)
//            }
//            .background(.black)
        }
        
    }
}

struct CommentTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
            .background(.black)
            .foregroundColor(.white)
    }
}
