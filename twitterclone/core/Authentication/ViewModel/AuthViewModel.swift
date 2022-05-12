//
//  AuthViewModel.swift
//  twitterclone
//
//  Created by Rahul Yadav on 25/04/22.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    private var tempUserSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fecthUser()
    }
    
    func login(withEmail email: String, password: String){
        print("DEBUG: Login with email \(email)")
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                
                return
            }
            
            guard let user = result?.user else{ return }
            self.userSession = user
            print("DEBUG: Did log user in..")
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                
                return
            }
            
            guard let user = result?.user else{ return }
            self.tempUserSession = user
            
            let data = ["email": email, "username": username.lowercased(), "fullname": fullname, "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                }
        }
    }
    func signOut() {
        //sets user session to nil so we show login view
        userSession = nil
        
        //signs user out on server
        try?Auth.auth().signOut()
    }
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                }
            
        }
    }
    
    func fecthUser() {
        guard let uid = self.userSession?.uid else { return }
        
        
        service.fetchuser(withUid: uid) { user in
            self.currentUser = user
        }
    }
    
}
