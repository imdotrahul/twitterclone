//
//  TweetRowView.swift
//  twitterclone
//
//  Created by Rahul Yadav on 13/04/22.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            //profile image + user info
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                //user info and tweet caption
                VStack(alignment: .leading, spacing: 4) {
                    
                    //user info
                    HStack {
                        Text("Ayushman Kumar")
                            .font(.subheadline).bold()
                        
                        Text("@joker")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    // tweet capions
                    Text("your moms favourite villian")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                    
                }
            }
            //action buttons
            HStack {
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }


            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
