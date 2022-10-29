//
//  SettingView.swift
//  SwiftUISystem
//
//  Created by Hing Tat Tsang on 30/7/2022.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        List {
            NavigationLink(destination: aboutView()) {
                Text("About")
            }
        }
        .navigationTitle("Settings")
    }
}

struct aboutView: View {
    var body: some View {
        List {
            HStack {
                Text("Name")
                Spacer()
                Text("SwiftUIOS Phone 1")
                    .foregroundColor(.gray)
            }
            HStack {
                Text("System:")
                Spacer()
                Text("SwiftUIOS 1.0")
                    .foregroundColor(.gray)
            }
            HStack {
                Text("Model Name:")
                Spacer()
                Text("iPhone")
                    .foregroundColor(.gray)
            }
            HStack {
                Text("Serial Number:")
                Spacer()
                Text("DFAFMDAIKFMA")
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("About")
    }
}

struct developer: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("TOOLS")) {
                    Button("View source code") {
                        guard let url = URL(string: "https://github.com/AlwaysBoringStudio/SwiftUISystem/find/main") else { return }
                        UIApplication.shared.open(url)
                    }
                    
                }
                
            }
            .navigationTitle("Developer options")
   
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
