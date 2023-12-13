//
//  AddNewFamilyMember.swift
//  EasyMeds
//
//  Created by apprenant51 on 08/12/2023.
//

import SwiftUI

struct AddNewFamilyMemberView: View {
        @Environment (\.dismiss) var dissmiss
        @State var familyLink: String = ""
        @State var  nameFamilyMember: String = ""
        @State var age : String = ""
    @Binding var activateModal : Bool
        var body: some View {
            
            VStack{
                HStack {
                    Spacer()
                    Button("X"){
                        dissmiss()
                    }
                }
                .padding()
                
                Text ("Membres de la famille")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                
                Spacer()

                VStack(alignment: .leading){
                    HStack (spacing: 20) {
                        Text("Lien")
                            .font(.title3)
                            .font(.subheadline)
                        TextField("Femme/Mari/Fille/Fils", text: $familyLink)
                            .frame(width: 200, height: 21)
                            .cornerRadius(5)
                            .padding()
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                    }
                    
                    HStack (spacing: 16) {
                        Text("Nom")
                            .font(.title3)
                        TextField("Prénom et Nom", text: $nameFamilyMember)
                            .frame(width: 200, height: 21)
                            .cornerRadius(5)
                            .padding()
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                    }
                    
                    HStack (spacing: 23) {
                        Text("Âge")
                            .font(.title3)
                        TextField("Âge", text: $age)
                            .frame(width: 200, height: 21)
                            .cornerRadius(5)
                            .padding()
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                    }
                    
                }
                .padding()
                
                Spacer()
                
                Button(action: {
                    activateModal.toggle()
                }
                       , label: {
                    HStack{
                        Text("Enregistrer")
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
        AddNewFamilyMemberView(activateModal: .constant(true))
    }

