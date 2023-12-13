

import SwiftUI

struct TestView: View {
    @State private var selctuser = "Cindy"
    
    let chouser = ["Cindy","Stephana","Niger", "Jean", "Justinya", "Jean-Sebastien"]
    let daycalendar = ["L", "M", "M", "J", "V", "S", "D"]
    @State private var selectedDay: Int?
    @State private var isMedicationTaken = false
    @State private var stockTestt: [Drug2] = stockTest
    
    @State private var selection: String?
    @State private var isMorningTaken = false
    @State private var isNoonTaken = false
    @State private var isEveningTaken = false
    //@State private var storyTreatment: [Traitement] = storyTreatment
    @State private var traitement: [Traitement] = storyTreatment

    
    func extractViewForMoments(traitement: Traitement) -> some View {
        VStack {
            
            if traitement.matin {
                ExtractView3(traitement: traitement, moment: "Matin", isMedicationTaken: $isMorningTaken)
                
            }
            if traitement.midi {
                ExtractView3(traitement: traitement, moment: "Midi", isMedicationTaken: $isNoonTaken)
            }
            if traitement.soir {
                ExtractView3(traitement: traitement, moment: "Soir", isMedicationTaken: $isEveningTaken)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                VStack(spacing: 5) {
                    HStack(spacing: 37) {
                        ForEach(daycalendar, id: \.self) { daycal in
                            Text(daycal)
                        }
                        .foregroundColor(.gray)
                    }
                    
                    VStack {
                        TabView {
                            calendarDay3(rangeDay: 1...7, selectedDay: $selectedDay)
                            calendarDay3(rangeDay: 8...14, selectedDay: $selectedDay)
                            calendarDay3(rangeDay: 15...21, selectedDay: $selectedDay)
                            calendarDay3(rangeDay: 22...28, selectedDay: $selectedDay)
                        }
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .frame(height: 30)
                    }
              
                    Text("Décembre")
                        .font(.system(size: 20))
                        .tracking(2)
                    HStack{
                        
                        Text("Traitement de :")
                            .font(.title2)
                            .padding()
                       Spacer()
                        HStack{
                                Picker("", selection: $selctuser) {
                                    ForEach(chouser, id: \.self){ user in
                                        Text(user)
                                    }
                                }
                                .tint((Color(.black)))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.colorButton, lineWidth: 2)
                                        .frame(width: 100, height: 35)
                                    
                                )
                            Spacer().frame(width: 30)
                        }
                    }
                }
           
                ScrollView{
                    
                    
                    
                    HStack {
                       
                    }
                    VStack(spacing: 6){
                        // Afficher les détails du traitement en fonction du jour sélectionné
                        if let selectedDay = selectedDay {
                            let matchingTreatments = storyTreatment.filter {
                                selectedDay >= $0.start && selectedDay < ($0.start + $0.duration)
                            }
                            
                            if !matchingTreatments.isEmpty {
                                VStack{
                                    Text(matchingTreatments[0].name)
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(.colorButton)
                                        .padding(.bottom)
                                        
                                  
                                }
                                
                                
                                VStack{
                                    ForEach(matchingTreatments) { treatment in
                                        extractViewForMoments(traitement: treatment)
                                            .transition(.opacity)
                                    }
                                }
                            } else {
                                VStack(spacing: 70){
                                    Text("Aucun traitement pour ce jour")
                                        .foregroundColor(.red)
                                        .font(.title3)
                                    Image("photoAsset")
                                        .resizable()
                                        .frame(width: 300, height: 200)
                                        .transition(.opacity)
                                    Spacer()
                                }
                            }
                        } else {
                            VStack(spacing: 70){
                                Text("Sélectionnez un jour pour afficher les détails")
                                    .font(.system(size: 23))
                                Image("photoAsset")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                                    .transition(.opacity)
                                Spacer()
                            }
                        }
                    }
                    
                    Spacer()
//                    VStack{
//                        HStack {
//                            Rectangle()
//                                .frame(height: 1)
//                                .foregroundColor(.colorButton)
//                            
//                        }
//                   
//                        Spacer()
//                    }
                }
                HStack(spacing: 0){
                    NavigationLink {
                        AddTreatmentView()
                    } label: {
                        Text("Ajoute un traitement")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(8)
                        Image(systemName: "plus.circle")
                            .font(.system(size: 35))
                            .foregroundColor(Color(.white))
                            .padding(6)
                    }
                    .background(.colorButton)
                    .cornerRadius(8)
                }
            }
        }
    }
    
    
    struct ExtractView3: View {
        var traitement: Traitement
        var moment: String
        
        @Binding var isMedicationTaken: Bool
        func majstock(typeMed: TypeMed, posology: Double) {
            if let index = stockTest.firstIndex(where: { $0.typeMed == typeMed }) {
                stockTest[index].quantity -= posology
            }
        }
        
        
        var body: some View {
            
           
                           
            
            VStack{
                HStack{
                    Text(moment)
                        .font(.title)
                        .padding(.leading, 40)
                    Spacer()
                }
                    
                    //.padding(-20)
                HStack{
                    if(traitement.drug.typeMed.rawValue == "cachets") {
                        Image(systemName: "pill")
                          
                        
                           
                    }else {
                        Image(systemName: "waterbottle")
                            .font(.system(size: 30))
                            .padding(.leading, 30)
                            
                        
                            
                    }
                    HStack{
                        Text(traitement.drug.name)
                            .font(.title2)
                            .bold()
                        if(traitement.drug.typeMed.rawValue == "cachets") {
                            Text("\(traitement.posology)")
                            if(traitement.posology > 1 ){
                                Text("cachets")
                            }else{
                                Text("cachet")
                            }
                               
                        }else {
                            
                            //Spacer()
                                
                        }
                    }
                    Spacer()
                    Toggle("Pris", isOn: $isMedicationTaken)
                        .onChange(of: isMedicationTaken) { oldValue, newValue in
                            if newValue {
                                // Mettre à jour le stock lorsque l'utilisateur prend le traitement le matin
                                self.majstock(typeMed: traitement.drug.typeMed, posology: Double(traitement.posology)) // Exemple de déduction pour le médicament "Advil" cachets
                            }

                        }
                        .padding(.trailing)
                        .labelsHidden()
                        .pickerStyle(SegmentedPickerStyle())
                }
                
                VStack{
                        if(traitement.meal){
                            HStack{
                                ZStack{
                                    Circle()
                                        .stroke(.colorButton, lineWidth: 2)
                                         .fill(.white)
                                         .frame(width: 32)
                                    
                                    Text("\(traitement.posology)")
                                        .foregroundStyle(.black)
                                }
                               
                                Text("comprimé durant le repas.")
                                Spacer()
                            }
                            .font(.title3)
                            .foregroundColor(.black)
                           
                            .padding(.leading, 25)
                        }else{
                            HStack {
                                Text("\(traitement.posology)")
                                Text("comprimé Avant/Aprés le repas")
                                Spacer()
                            }
                            .font(.title3)
                            .foregroundColor(.black)
                            .padding(.leading, 30)
                        }
                    
                        
                      
                    }
                
                
            }
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.colorButton, lineWidth: 2)
                    .frame(width: 370, height: 160)
                
            )
            Spacer().frame(height: 40)
//            .border(.green).frame(width: 370)
//            .cornerRadius(16)
//            Spacer().frame(height: 25)
//            
        }
    }
}
#Preview {
    TestView()
}

struct calendarDay3: View {
    var rangeDay: ClosedRange<Int>
    @Binding var selectedDay: Int?
    @State private var selectedButton: Int?
    
    var body: some View {
        HStack {
            ForEach(rangeDay, id: \.self) { numberss in
                Button(action: {
                                   selectedDay = numberss
                                   selectedButton = numberss
                }) {
                    ZStack{
                        if selectedButton == numberss{
                            Circle()
                                .foregroundColor(.colorButton)
                        }
                        Text(String(numberss))
                            .font(.title3)
                            .fontWeight(selectedButton == numberss ? .bold : .semibold)
                            .foregroundStyle(selectedButton == numberss ? .white : .colorButton)
                        
                    }
                }
                               .frame(width: 41)
            }
        }
    }
}

