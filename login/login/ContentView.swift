//
//  ContentView.swift
//  login
//
//  Created by lhj on 2025/1/11.

import SwiftUI

// 登录视图
struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoginSuccessful: Bool = false

    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                VStack(spacing: 20) {
                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button("Login") {
                        login()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                    
                    // 提示框显示登录状态
                    .alert(isPresented: .constant(username == "admin" && password == "123456" && !isLoginSuccessful)) {
                        Alert(title: Text("Login Status"), message: Text("Login Successful!"), dismissButton: .default(Text("OK")))
                    }
                }
                .navigationDestination(isPresented: $isLoginSuccessful) {
                    HomeView()
                }
                .padding()
            }
        } else {
            // Fallback on earlier versions
        }
    }

    // 登录逻辑
    func login() {
        if username == "admin" && password == "123456" {
            DispatchQueue.main.async {
                isLoginSuccessful = true
            }
        } else {
            print("Invalid credentials")
        }
    }
}

// 主界面
struct HomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to Home View!")
                .font(.largeTitle)
                .padding()
            Text("You have successfully logged in.")
        }
    }
}

#Preview {
    ContentView()
}
