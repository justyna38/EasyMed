import SwiftUI

struct ProfilView: View {
    @State var  name: String = ""
    @State var  phoneNumber: String = ""
    @State var  email: String = ""
    @State var activateModal = false
    var body: some View {
        
        VStack{
            
            VStack(alignment: .leading) {
                HStack{
                    Image(systemName: "person.fill")
                        .font(.title)
                    Text("Mon profil")
                        .font(.system(size: 21))
                        .bold()
                        .padding()
                    
                    Spacer()
                    
                }
                VStack(content: {
                    Text("Nom")
                        .font(.title3)
                })
                HStack (spacing: 16) {
                    
//                    Text("Nom")
//                        .font(.title3)
                    
                   Text ("Cindy")
                        .frame(width: 290, height: 20)
                        .cornerRadius(5)
                        .padding()
                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                }
            }
            .padding()
            
            VStack(alignment: .leading){
               
                HStack{
                    Image(systemName: "person.3.fill")
                        .font(.title2)
                    Text("Membres de ma famille")
                        .bold()
                        .padding()
                    
                        .font(.system(size: 25))
                    Spacer()
                }
                Text("Niger")
                Text("Justyna")
                Text("Stefania")
                Text("Jean-Sébastien")
                Text("Jean")
                
               
                    HStack{
                        ZStack{
                     
                    }
    
                        Button(action: {
                            activateModal.toggle()
                        }
                               , label: {
                            HStack {
                                
                                Text("Nouveau membre")
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
                            AddNewFamilyMemberView(activateModal: $activateModal)
                 
                    })
                }
            }
                     .padding()
            VStack(alignment: .leading){
               
                HStack{
                    Image(systemName: "info.circle.fill")
                        .font(.title)
                    Text("Informations")
                        .font(.system(size: 21))
                        .bold()
                       
                    Spacer()
                }
                VStack(content: {
                    Text("Tèl:")
                        .font(.title3)
                })
                HStack (spacing: 30) {
                    
////                    Text("Tél")
//                        .font(.title3)
                    TextField("Téléphone", text: $phoneNumber)
                        .frame(width: 290, height: 21)
                        .cornerRadius(5)
                        .padding()
                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                }
                VStack(content: {
                    Text("Email")
                        .font(.title3)
                })
                HStack (spacing: 10) {
//                    Text("Email")
//                        .font(.title3)
                    TextField("Adresse mail", text: $email
                    )
                        .frame(width: 290, height: 21)
                        .cornerRadius(5)
                        .padding()
                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                }
            }
            
            .padding()
            
        }
    }
}

#Preview {
    ProfilView()
}
