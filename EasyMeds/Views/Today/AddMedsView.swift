//
//  AddMedsView.swift
//  EasyMeds
//
//  Created by Justyna Warzecha on 07/12/2023.
//

import SwiftUI


struct AddMedsView: View {
    @Environment (\.dismiss) var dissmiss
//    @State var drugs: [Drug2] = stockTest
    
    @State var typeMedicaments: TypeMed = .cachets
    @State var nameMedicaments: String = ""
    @State var expiration = Date()
    @State var quantity: Double = 0.0
    @State var quantityText: String = ""
    @State var isCachets: Bool = false
    @State var isSirop: Bool = false
    @Binding var activateModal : Bool
    
    func addMedicament(nameMedicament: String, quantite: Double, dateMed: Date, typeMedicament: TypeMed ) {
        //let formatDate = DateFormatter()
        let nameMedicament = nameMedicament.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
//        var tabDrug: [Drug2] = stockTest
//        drugs = stockTest
//        drugs.append(Drug2(name: nomMedicament, quantity: quantite, dateExp: dateMed, typeMed: typeMedicament))
//        print(drugs)
        stockTest.append(Drug2(name: nameMedicament, quantity: quantite, dateExp: dateMed, typeMed: typeMedicament))
        
        
    }
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Button("Fermer"){
                    dissmiss()
                }
            }
            .padding()
            
            Text ("Ajouter un médicament")
                .font(.title2)
                .bold()
            
            Spacer()
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    isCachets.toggle()
                    isSirop = false
                    if isCachets == true {
                        typeMedicaments = .cachets
                    }
                    
                }, label: {
                    HStack{
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundStyle(isCachets ? Color.colorButton : .white)
                            Image(systemName: "pill")
                                .padding()
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(isCachets == false ? .colorButton : .white)
                                .frame(width: 140, height: 55)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.colorButton, lineWidth: 5)
                                        .frame(width: 140, height: 55)
                                    
                                )
                        }
                    }
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 55)

                    
                })
                Spacer()
                
                Button(action: {
                    isSirop.toggle()
                    isCachets = false
                    if isSirop == true {
                        
                       
                            
                        typeMedicaments = .sirop
                        
                    }
                }, label: {
                    HStack{
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundStyle(isSirop ? Color.colorButton : .white)
                            
                            Image(systemName: "waterbottle")
                                .padding()
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(isSirop == false ? .colorButton : .white)
                                .frame(width: 140, height: 55)

                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.colorButton, lineWidth: 5)
                                        .frame(width: 140, height: 55)
                                   
                                )
                        }
                    
                    }
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 55)
                })
                
                Spacer()

                
            }
            
            
            VStack(alignment: .leading, spacing: 15){
//                HStack {
                    //  VStack (alignment: .leading) {
                        Text("Nom :")
                            //.padding()
                            .font(.title3)
                            .font(.subheadline)
                        TextField("(mg) / (ml) ", text: $nameMedicaments)
                            .frame(width: 320, height: 21)
                            .cornerRadius(5)
                            .padding()
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
//                    }
//                    .padding()
//                    Spacer()
          //      }
                
                HStack{
                    VStack (alignment: .leading) {
                        
                        Text("Quantité :")
                            //.padding()
                            .font(.title3)
    
                        TextField("(mg) / (ml) ", text: $quantityText)
                            .frame(width: 320, height: 21)
                            .cornerRadius(5)
                            .padding()
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                    }
                    Spacer()
                }
                
                HStack {
                    HStack {
                        Text("Expiration:")
                            .font(.title3)
                        DatePicker("", selection: $expiration, displayedComponents: .date)
                            .frame(width: 200, height: 21)
                            .labelsHidden()
                            .padding()
                        
                    }
                    //                    Text("Expire le :")
                    //                        .font(.title3)
                    //                        .font(.subheadline)
                    //                    TextField("mois/année", text: $expiration)
                    //                        .cornerRadius(5)
                    //                        .padding()
                    //                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                }
                
            }
            .padding()
            
            Spacer()
            
            Button(action: {
                if let convertedValue = Double(quantityText) {
                    quantity = convertedValue
                }
                self.addMedicament(nameMedicament: nameMedicaments, quantite: quantity, dateMed: expiration, typeMedicament: typeMedicaments)
                activateModal.toggle()
//                if let lastElement = stockTest.last {
//                    print(stockTest)
                //}
            }, label: {
                HStack{
                    Text("Enregistrer ce médicament")
                        .frame(width: 250)
                        .padding()
                        .foregroundColor(.white)
                }
                .background(.colorButton)
                .cornerRadius(10)
            })
            Spacer()
            //            }
            
        }
    }
    
    
}



#Preview {
    AddMedsView(activateModal: .constant(true))
}


//func addMedicament(nameMedicament: String, quantite: Double, dateMed: Date, typeMedicament: TypeMed ) {
//    //let formatDate = DateFormatter()
//    let nomMedicament = nameMedicament.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
//    var tabDrug: [Drug2] = stockTest
//    tabDrug.append(Drug2(name: nomMedicament, quantity: quantite, dateExp: dateMed, typeMed: typeMedicament))
//    print(tabDrug)
//
//}



////
////  AddMedsView.swift
////  EasyMeds
////
////  Created by Justyna Warzecha on 07/12/2023.
////
//
//import SwiftUI
//
//
//struct AddMedsView: View {
//    @Environment (\.dismiss) var dissmiss
////    @State var drugs: [Drug2] = stockTest
//    
//    @State var typeMedicaments: TypeMed = .cachets
//    @State var nameMedicaments: String = ""
//    @State var expiration = Date()
//    @State var quantity: Double = 0.0
//    @State var quantityText: String = ""
//    @State var isCachets: Bool = false
//    @State var isSirop: Bool = false
//    @Binding var activateModal : Bool
//    
//    func addMedicament(nameMedicament: String, quantite: Double, dateMed: Date, typeMedicament: TypeMed ) {
//        //let formatDate = DateFormatter()
//        let nameMedicament = nameMedicament.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
////        var tabDrug: [Drug2] = stockTest
////        drugs = stockTest
////        drugs.append(Drug2(name: nomMedicament, quantity: quantite, dateExp: dateMed, typeMed: typeMedicament))
////        print(drugs)
//        stockTest.append(Drug2(name: nameMedicament, quantity: quantite, dateExp: dateMed, typeMed: typeMedicament))
//        print(stockTest[0].name)
//        
//        
//    }
//    
//    var body: some View {
//        VStack(){
//            HStack {
//                Spacer()
//                Button("Fermer"){
//                    dissmiss()
//                }
//                
//            }
//            .padding()
//            
//            Text ("Ajouter un médicament")
//                .font(.title2)
//                .bold()
//            
//            Spacer()
//            
//            HStack {
//                
//                Spacer()
//                
//                Button(action: {
//                    isCachets.toggle()
//                    isSirop = false
//                    if isCachets == true {
//                        
//                       
//                            
//                        typeMedicaments = .cachets
//                        
//                    }
//                    
//                }, label: {
//                    HStack{
//                        ZStack {
//                            RoundedRectangle(cornerRadius: 16)
//                                .foregroundStyle(isCachets ? Color.colorButton : .white)
//                            Image(systemName: "pill")
//                                .padding()
//                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                                .foregroundStyle(isCachets == false ? .colorButton : .white)
//                                .frame(width: 140, height: 55)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 16)
//                                        .stroke(Color.colorButton, lineWidth: 5)
//                                        .frame(width: 140, height: 55)
//                                    
//                                )
//                        }
//                    }
//                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 55)
//
//                    
//                })
//                Spacer()
//                
//                Button(action: {
//                    isSirop.toggle()
//                    isCachets = false
//                    if isSirop == true {
//                        
//                       
//                            
//                        typeMedicaments = .sirop
//                        
//                    }
//                }, label: {
//                    HStack{
//                        ZStack {
//                            RoundedRectangle(cornerRadius: 16)
//                                .foregroundStyle(isSirop ? Color.colorButton : .white)
//                            
//                            Image(systemName: "waterbottle")
//                                .padding()
//                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                                .foregroundStyle(isSirop == false ? .colorButton : .white)
//                                .frame(width: 140, height: 55)
//
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 16)
//                                        .stroke(Color.colorButton, lineWidth: 5)
//                                        .frame(width: 140, height: 55)
//                                   
//                                )
//                        }
//                    
//                    }
//                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 55)
//                })
//                
//                Spacer()
//
//                
//            }
//            
//            
//            VStack(spacing: 15){
//                HStack {
//                    VStack (alignment: .leading) {
//                        Text("Nom :")
//                            //.padding()
//                            .font(.title3)
//                            .font(.subheadline)
//                        TextField("(mg) / (ml) ", text: $nameMedicaments)
//                            .frame(width: 320, height: 21)
//                            .cornerRadius(5)
//                            .padding()
//                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
//                    }
//                    .padding()
//                    Spacer()
//                }
//                
//                HStack{
//                    VStack (alignment: .leading) {
//                        
//                        Text("Quantité :")
//                            //.padding()
//                            .font(.title3)
//    
//                        TextField("(mg) / (ml) ", text: $quantityText)
//                            .frame(width: 320, height: 21)
//                            .cornerRadius(5)
//                            .padding()
//                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
//                    }
//                    Spacer()
//                }
//                
//                HStack {
//                    HStack {
//                        Text("Expiration:")
//                            .font(.title3)
//                        DatePicker("", selection: $expiration, displayedComponents: .date)
//                            .frame(width: 200, height: 21)
//                            .labelsHidden()
//                            .padding()
//                        
//                    }
//                    //                    Text("Expire le :")
//                    //                        .font(.title3)
//                    //                        .font(.subheadline)
//                    //                    TextField("mois/année", text: $expiration)
//                    //                        .cornerRadius(5)
//                    //                        .padding()
//                    //                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
//                }
//                
//            }
//            .padding()
//            
//            Spacer()
//            
//            Button(action: {
//                if let convertedValue = Double(quantityText) {
//                    quantity = convertedValue
//                }
//                self.addMedicament(nameMedicament: nameMedicaments, quantite: quantity, dateMed: expiration, typeMedicament: typeMedicaments)
//                activateModal.toggle()
//                if let lastElement = stockTest.last {
//                    print(stockTest)
//                }
//            }, label: {
//                HStack{
//                    Text("Enregistrer ce médicament")
//                        .frame(width: 250)
//                        .padding()
//                        .foregroundColor(.white)
//                }
//                .background(.colorButton)
//                .cornerRadius(10)
//            })
//            Spacer()
//            //            }
//            
//        }
//    }
//    
//    
//}
//
//
//
//#Preview {
//    AddMedsView(activateModal: .constant(true))
//}
//
//
////func addMedicament(nameMedicament: String, quantite: Double, dateMed: Date, typeMedicament: TypeMed ) {
////    //let formatDate = DateFormatter()
////    let nomMedicament = nameMedicament.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
////    var tabDrug: [Drug2] = stockTest
////    tabDrug.append(Drug2(name: nomMedicament, quantity: quantite, dateExp: dateMed, typeMed: typeMedicament))
////    print(tabDrug)
////    
////}
//
