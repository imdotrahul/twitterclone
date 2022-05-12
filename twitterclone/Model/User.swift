//
//  User.swift
//  twitterclone
//
//  Created by Rahul Yadav on 12/05/22.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
