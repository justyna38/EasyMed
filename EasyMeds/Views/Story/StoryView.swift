//
//  TreatmentHistoryView.swift
//  EasyMeds
//
//  Created by Justyna Warzecha on 07/12/2023.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        VStack {
            //            //Spacer().frame(height: 35)
            Text("Historique des traitements")
                            .font(.system(size: 20))
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding()
            List{
                ExtractedStoryView2(name: "Stefania", sick: "Otite", date: "5/12/2023 - 7/12/2023")
                ExtractedStoryView2(name: "Niger", sick: "Grippe", date: "5/11/2023 - 8/12/2023")
                ExtractedStoryView2(name: "Niger", sick: "Asthme", date: "20/06/2022 - 20/09/2022")
                ExtractedStoryView2(name: "Jean", sick: "Diabète", date: "10/07/2023 - 10/11/2023")
                ExtractedStoryView2(name: "Justyna", sick: "Migraine", date: "20/11/2023 - 15/12/2023")
                ExtractedStoryView2(name: "Jean-Sébastien", sick: "Arthrite", date: "12/11/2023 - 12/05/2024")
                //
            }
                    }
        }
    }
    

#Preview {
    StoryView()
}
struct ExtractedStoryView2: View {
    let name: String
    let sick: String
    let date: String
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Circle()
                    .frame(height:20)
                    .foregroundColor(.colorButton)
                Text(date)
                    .tracking(1)
                    .bold()
                    .font(.system(size: 20))
            }
            .padding()
         
            HStack() {
                Text("\(name):")
                    .font(.title2)
                    .fontWeight(.light)
                    .padding(.leading, 40)
                Text(sick)
                    .font(.title2)
                    .fontWeight(.medium)
                Spacer()
            }
            .padding(.bottom)
            
        }
        .background(.good)
        .cornerRadius(15)
        .padding()
        .frame(width: 370)
    }
}
