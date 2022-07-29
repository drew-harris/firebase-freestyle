//
//  ContentView.swift
//  FirebaseFreestyle
//
//  Created by Drew Harris on 7/29/22.
//
// I just want to add a new user

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var email = "";
    @State private var password = "";
    @State private var authHandler: AuthStateDidChangeListenerHandle? = nil;
    
    @State private var isSuccess = false;
    @State private var user: User? = nil;
    
    func setupAuthListener() {
        authHandler = Auth.auth().addStateDidChangeListener { auth, user in
            self.user = user
        }
    }
    
    func teardownAuth() {
        Auth.auth().removeStateDidChangeListener(authHandler!);
    }
    
    func login() {
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            if error != nil {
                print(error?.localizedDescription ?? "Could not parse error")
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch  {
            print("Could not sign out")
        }
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Email", text: $email)
                TextField("Password", text: $password)
                Button("Register") {
                    login()
                }
                Button("Sign out") {
                    signOut()
                }
                Section {
                    Text("User info").font(.headline)
                    Text(user?.email ?? "No user")
                    Text(user?.uid ?? "No user")
                }
            }.onAppear(perform: setupAuthListener)
                .onDisappear(perform: teardownAuth)
                .navigationTitle("User Status")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
