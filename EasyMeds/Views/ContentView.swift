//
//  ContentView.swift
//  EasyMeds
//
//  Created by Justyna Warzecha on 05/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
        
           
            TestView()
                .tabItem {
                    Label("Accueil", systemImage: "calendar")
                }
            
            StoryView()
                .tabItem {
                    Label("Historique", systemImage: "magnifyingglass")
                        }
            
            InventoryView()
                .tabItem {
                    Label("Stock", systemImage: "pill")
                }
            
            ProfilView()
                .tabItem {
                    Label("Profil", systemImage: "gearshape")
                }
        }

    }
}

#Preview {
    ContentView()
}
