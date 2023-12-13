import SwiftUI

struct AcceuilView2: View {
    @State private var selctuser = "Cindy"
    let chouser = ["Cindy","Stephana","Niger", "Jean", "Justinya", "Jean-Sebastien"]
    let daycalendar = ["L", "M", "M", "J", "V", "S", "D"]
    @State private var topExpanded: Bool = false
    @State private var topExpanded2: Bool = false
    var body: some View {
        NavigationView{
            VStack(spacing: 15){
                VStack(spacing: 5){
                    
                    HStack(spacing: 37){
                        ForEach(daycalendar, id: \.self) { daycal in
                            Text(daycal)
                        }
                        .foregroundColor(.gray)
                    }
                    
                    VStack{
                        TabView{
                            calendarDay(rangeDay: 1...7)
                            calendarDay(rangeDay: 8...14)
                            calendarDay(rangeDay: 15...21)
                            calendarDay(rangeDay: 22...28)
                        }
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .frame(height: 30)
                    }
                    Text("Décembre")
                        .font(.system(size: 20))
                        .underline()
                        .tracking(2)
                    
                    HStack{
                        Spacer()
                            VStack(spacing: 0) {
                                Picker("", selection: $selctuser) {
                                    ForEach(chouser, id: \.self){ user in
                                        Text(user)
                                    }
                                }
                                .tint((Color("colorButton")))
                        }
                    }
                }
                
                    HStack{
                        Text("Vos traitements en cours :")
                            .bold()
                            .font(.title2)
                            .padding()
                        Spacer()
                    }
                    
                ScrollView{
                    DisclosureGroup("Grippe A", isExpanded: $topExpanded){
                        HStack{
                            Text("Doliprane")
                            Text("1000mg")
                        }
                        .font(.title3)
                        Text("prise")
                        Text("14h00")
                        Image(systemName: "fork.knife.circle.fill")
                    }
                    .padding()
                    .font(.title)
                    .tint(.black)
                    Spacer()
                    DisclosureGroup("Grippe B", isExpanded: $topExpanded2){
                        HStack{
                            Text("Doliprane")
                            Text("1000mg")
                        }
                        .font(.title3)
                        Text("prise")
                        Text("14h00")
                        Image(systemName: "fork.knife.circle.fill")
                    }
                    .padding()
                    .font(.title)
                    .tint(.black)
                    if topExpanded == false && topExpanded2 == false {
                        Image("photo_acceuil4")
                            .resizable()
                            .frame(width: 300, height: 200)
                    }
                }
                .frame(height: 400)
                
                VStack{
                    HStack(spacing: 0){
                        NavigationLink {
                            AddTreatmentView()
                        } label: {
                            Text("Ajoute un traitement")
                                .font(.title)
                                .foregroundColor(.black)
                            Image(systemName: "plus.circle")
                                .font(.system(size: 50))
                                .foregroundColor(Color("colorButton"))
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}
#Preview {
    AcceuilView2()
}

struct calendarDay2: View {
    var rangeDay: ClosedRange<Int>
    var body: some View {
        HStack{
            ForEach(rangeDay, id: \.self) { numberss in
                HStack{
                    Spacer()
                    Text(String(numberss))
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .frame(width: 41)
            }
            
        }
    }
}
