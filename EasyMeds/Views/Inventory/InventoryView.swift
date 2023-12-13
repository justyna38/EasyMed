//
//  StockView.swift
//  EasyMeds
//
//  Created by Justyna Warzecha on 06/12/2023.
//

import SwiftUI

struct InventoryView: View {
    
    @State private var drugs: [Drug2] = stockTest
    @State private var filtreNames = ["filtre", "cachets", "sirop", "parimé", "bons"]
    @State private var searchText: String = ""
    @State private var fieldValue: String = ""
    @State private var onlyPills: Bool = false
    @State private var onlySirop: Bool = false
    @State private var onlyGood: Bool = false
    @State private var onlyExp: Bool = false
    var filteredDrugs: [Drug2] {
        if searchText.isEmpty {
            return drugs
        } else {
            return drugs.filter { $0.name.lowercased().contains(self.searchText.lowercased()) }
        }
    }
    
    func filterData() {
        
        if filtreNames.contains("cachets") {
            drugs = filteredDrugs.filter { $0.typeMed.rawValue == "cachets" }
        }
        if filtreNames.contains("sirop") {
            drugs = filteredDrugs.filter { $0.typeMed.rawValue == "sirop" }
        }

    }
    
    func removeRows(at offsets: IndexSet) {
        drugs.remove(atOffsets: offsets)
    }
    var body: some View {
        VStack{
            
            Text("Mes stocks")
                .padding()
                .font(.largeTitle)
            HStack{
            TextField("Rechercher", text: $searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            Picker("", selection: $fieldValue){
                ForEach(filtreNames, id: \.self) {
                    Text($0)
                }
            }
        }
            List{
               
                
                ForEach(filteredDrugs) { drug in
                    StockView(drug: drug, stockBackgroungColor: .red, fontColor: .green, iconDrug: "pill")
                }
                .onDelete(perform: removeRows)
                .padding()
                
                //                ForEach(drugs){ drug in
                //                    StockView(drug: drug, stockBackgroungColor: .red, fontColor: .green, iconDrug: "pill")
                //
                //                }
                
                
            }
            .onAppear{
                drugs = stockTest
            }
            
            
        }
    }
}

#Preview {
    InventoryView()
}

struct StockView: View {
    
    var drug: Drug2
    private let dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
           return formatter
       }()

    let stockBackgroungColor: Color
    let fontColor: Color
    let iconDrug: String
    var body: some View {
        VStack{
            VStack{
                HStack
                {
                    ZStack{
                        Text(drug.name)
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundStyle(drug.dateExp >= Date.now ? .stockGreen : .fontPerime)
//                        Rectangle()
//                            .foregroundStyle(.white)
//                            .frame(width: 166)
                        
                    }
                    .cornerRadius(15)
                    
                   
                    Spacer()
                    HStack{
//                        Image(systemName: drug.typeMed.rawValue == "cachets" ? "pill" : "waterbottle")
//                            .font(.system(size: 30))
//                            .foregroundStyle(drug.dateExp >= Date.now ? .fontPerime : .fontPerime)
                        ZStack{
                            Rectangle()
                                .foregroundStyle(drug.dateExp >= Date.now ? .green.opacity(0.3) : .red.opacity(0.6))
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                .cornerRadius(20)
                            Text("\(Int(drug.quantity))")
                                .fontWeight(.heavy)
                                .font(.title)
                                .foregroundStyle(drug.dateExp >= Date.now ? .stockGreen : .white)
                        }
                    }
                    
                }
                //.opacity(0.7)
                .padding()
                HStack{
                    Text("Expire le")
                    Text("\(drug.dateExp, formatter: dateFormatter)")
                        
                    Spacer()
                       
                        
                }
                .font(.title3)
                .foregroundStyle(drug.dateExp >= Date.now ? .green : .red)
                .padding()
                
                
                
            }
            .frame(width: 320, height: 130)
            
            .background(drug.dateExp >= Date.now ? .white : .stockRed.opacity(0.3))
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                    .frame(width: 320, height: 130)
            )
            

            .padding()
//            Button(action: {
//                print(drug.name)
//            }, label: {
//                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
//            })
            
        }
    }
}
