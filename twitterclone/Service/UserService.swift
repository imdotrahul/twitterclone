//
//  UserService.swift
//  twitterclone
//
//  Created by Rahul Yadav on 11/05/22.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    func fetchuser(withUid uid: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let data = snapshot else { return }
                
                print("DEBUG: User data is \(data)")
                
                guard let user = try? snapshot?.data(as: User.self) else { return }
                
                completion(user)
            }
    }
}
