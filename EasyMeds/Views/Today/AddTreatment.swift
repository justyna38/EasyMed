//
//  AddTreatment.swift
//  EasyMeds
//
//  Created by Justyna Warzecha on 05/12/2023.
//

import SwiftUI

struct AddTreatmentView: View {
    @State var clickText: Bool = true
    @State var activateModal = false
    @State var nameTreatment: String = ""
    @State var medicamentSearch : String = ""
    @State var displaySearch: Bool = true
    @State var textAppear: String = ""
    @State var start: String = ""
    @State var duration: String = ""
    @State var meal: Bool = false
    @State var isTakenMorning: Bool = false
    @State var isTakenLunch: Bool = false
    @State var isTakenDinner: Bool = false
    @State var posology: String = ""
    @State var currentDate = Date()
    
    var drugResults : [Drug2] {
        stockTest.filter {
            $0.name.lowercased()
                .contains(medicamentSearch.lowercased())
        }
    }
    
    func addTreatement(nameTreatement: String, drugName: Drug2, start: String, duration: String, meal: Bool, matin: Bool, midi: Bool, soir: Bool, posology: String ) {
        //let formatDate = DateFormatter()
        let nameTreatement = nameTreatement.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        let startToInt = Int(start) ?? 0
        let durationToInt = Int(duration) ?? 0
        let posologyToInt = Int(posology) ?? 0
        print(storyTreatment)
        storyTreatment.append(Traitement(name: nameTreatement, drug: drugName, start: startToInt, duration: durationToInt, meal: meal, matin: matin, midi: midi, soir: soir, posology: posologyToInt))
        print(storyTreatment)

    }
    
    var body: some View {
        
        VStack {
            Text ("Nouveau traitement")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
        }
        
        
        ScrollView{
            
            VStack(spacing: 15){
              
                VStack(alignment: .leading){
                    //VStack {
                        HStack{
                            Text("Nom  du traitement")
                                .font(.title3)
                                .font(.subheadline)
                                //.padding(.leading)
                            Spacer()
                        }
                        
                        TextField("Nom du traitement", text: $nameTreatment)
                            .frame(width: 320, height: 12)
                            .cornerRadius(5)
                            .padding()
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                            .padding(.bottom, 20)
                            
                   // }
//                    VStack(alignment: .leading) {
                        Text("Chercher dans mon stock")
                            .font(.title3)
                            .font(.subheadline)
                    //.padding(.leading)
                        TextField("Nom de medicament", text: $medicamentSearch)
                            .frame(width: 320, height: 12)
                            .cornerRadius(5)
                            .padding()
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                          
                    if displaySearch {
                        ForEach(drugResults, id: \.self) { drug in
                            
                            HStack{
                                Text(drug.name)
                                    .padding(.trailing)
                                Text(": \(Int(drug.quantity)) cachets")
                                Spacer()
                            }
                            //                        }
                            .padding()
                            
                            .onTapGesture {
                                medicamentSearch = drug.name
                                displaySearch = false
                        }
                            }
                    
                    .padding(.horizontal)
                    
                    }

                    Button(action: {
                        activateModal.toggle()
                    }
                           , label: {
                        HStack {
                            
                            Text("Nouveau médicament")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.colorButton)
                            Image(systemName: "plus.circle")
                                .font(.title)
                                .foregroundColor(.colorButton)
                                .padding(.leading, 10)

                            
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.colorButton, lineWidth: 2)
                                .frame(width: 259, height: 55)
                            
                        )
                        
                    })
                    .sheet(isPresented: $activateModal, content: {
                        AddMedsView(activateModal: $activateModal)
                    })
                    
                    
                        Text("Début")
                            .font(.title3)
                            .font(.subheadline)
                        //.padding(.leading)
                        TextField("Indiquez le début du traitement", text: $start)
                            .frame(width: 320, height: 12)
                            .cornerRadius(5)
                            .padding()
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                            .padding(.bottom, 20)
                        Text("Durée")
                            .font(.title3)
                            .font(.subheadline)
                        //.padding(.leading)
                        TextField("Nombre de jours", text: $duration)
                            .frame(width: 320, height: 12)
                            .cornerRadius(5)
                            .padding()
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                    
                            //.padding()
                    Toggle("Au repas", isOn: $meal)
                        .font(.title3)
                        .padding(.init(top: 20, leading: 0, bottom: 20, trailing: 10))
                    Text("Posologie")
                        .font(.title3)
                        .font(.subheadline)
                    TextField("Nombre de jours", text: $posology)
                        .frame(width: 320, height: 12)
                        .cornerRadius(5)
                        .padding()
                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                    }
                //}
                
                
                //VStack(spacing: 2){
                 
                
                    VStack(spacing: 2){
                
                        Toggle("Matin", isOn: $isTakenMorning)
                            .font(.title3)
                            .padding(.init(top: 20, leading: 0, bottom: 20, trailing: 10))
//                        if isTakenMorning {
//                            HStack {
//                                DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
//                                    .labelsHidden()
//                                    .padding()
//                                TextField("(mg) ou (ml) par prise", text: $matin)
//                                    .cornerRadius(5)
//                                    .padding()
//                                    .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
//                                    .padding(.bottom)
//                                
//                            }
                        //}
                        
            //        }
//                    VStack(spacing: 2){
                        Toggle("Midi", isOn: $isTakenLunch)
                            .font(.title3)
                            .padding(.init(top: 20, leading: 0, bottom: 20, trailing: 10))
//                        if isTakenLunch {
//                            HStack {
//                                DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
//                                    .labelsHidden()
//                                    .padding()
//                                TextField("(mg) ou (ml) par prise", text: $midi)
//                                    .cornerRadius(5)
//                                    .padding()
//                                    .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
//                                    .padding(.bottom)
//                                
//                            }
//                        }
                        
//                    }
                    //VStack(spacing: 1){
                        
                        Toggle("Soir", isOn: $isTakenDinner)
                            .font(.title3)
                            .padding(.init(top: 20, leading: 0, bottom: 20, trailing: 10))
//                        if isTakenDinner {
//                            HStack {
//                                DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
//                                    .labelsHidden()
//                                    .padding()
//                                TextField("(mg) ou (ml) par prise", text: $soir)
//                                    .cornerRadius(5)
//                                    .padding()
//                                    .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
//                                    .padding(.bottom)
//                                
//                            }
//                        }
                    }
                    
               // }
                
                Button(action: {
                    self.addTreatement(nameTreatement: nameTreatment, drugName: drugResults[0], start: start, duration: duration, meal: meal, matin: isTakenMorning, midi: isTakenLunch, soir: isTakenDinner, posology: posology)
                }, label: {
                    HStack{
                        Text("Enregistrer")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(width: 250)
                            .padding()
                            .foregroundColor(.white)
                    }
                    .background(.colorButton)
                    .cornerRadius(10)
                    
                    
                })
                .padding()
            }
            .padding(.horizontal)
        }
    }
    
}

#Preview {
    AddTreatmentView()
}

