import SwiftUI

struct AcceuilView: View {
    @State private var selctuser = "Cindy"
    let chouser = ["Cindy","Stephana","Niger", "Jean", "Justinya", "Jean-Sebastien"]
    let daycalendar = ["L", "M", "M", "J", "V", "S", "D"]
    @State private var topExpanded: Bool = false
    @State private var topExpanded2: Bool = false
    var body: some View {
        NavigationView{
            VStack(spacing: 80){
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
                    Image("photo_acceuil4")
                    .resizable()
                    .frame(width: 300, height: 200)
//                ScrollView{
//                    DisclosureGroup("Grippe A", isExpanded: $topExpanded){
//                        HStack{
//                            Text("Doliprane")
//                            Text("1000mg")
//                        }
//                        .font(.title3)
//                        Text("prise")
//                        Text("14h00")
//                        Image(systemName: "fork.knife.circle.fill")
//                    }
//                    .padding()
//                    .font(.title)
//                    .tint(.black)
//                    Spacer()
//                    DisclosureGroup("Grippe B", isExpanded: $topExpanded2){
//                        HStack{
//                            Text("Doliprane")
//                            Text("1000mg")
//                        }
//                        .font(.title3)
//                        Text("prise")
//                        Text("14h00")
//                        Image(systemName: "fork.knife.circle.fill")
//                    }
//                    .padding()
//                    .font(.title)
//                    .tint(.black)
//                    DisclosureGroup("Grippe A", isExpanded: $topExpanded){}
//                        .tint(.white)
//                    if topExpanded == true{
//                        DisclosureGroup("Grippe A", isExpanded: $topExpanded){
//                            HStack{
//                                Text("Doliprane")
//                                Text("1000mg")
//                            }
//
//                            .font(.title3)
//                            Text("prise")
//                            Text("14h00")
//                            Image(systemName: "fork.knife.circle.fill")
//                        }
//                        .background(.colorButton)
//                        .cornerRadius(16)
//                        .padding()
//                        .font(.title)
//                        .tint(.black)
//                        Spacer()
//
//                    }
//                    if topExpanded == false{
//                        Image("photo_acceuil4")
//                            .resizable()
//                            .frame(width: 300, height: 200)
//                    }
//                }
//                .frame(height: 400)
//                .animation(nil)
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
    AcceuilView()
}

struct calendarDay: View {
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


//
//
//import SwiftUI
//
//struct AcceuilView: View {
//  @State private var selctuser = "Cindy"
//    
//  let chouser = ["Cindy","Stephana","Niger", "Jean", "Justinya", "Jean-Sebastien"]
//  let daycalendar = ["L", "M", "M", "J", "V", "S", "D"]
//    @State private var selectedDay: Int?
//    
//  @State private var selection: String?
////  @State private var storyTreatment: [Traitement] = [(Traitement(name: "rr", drug: stockTest[0], start: 2, duration: 2, meal: true, matin: true, midi: true, soir: true, posology: 4))]
//   
//    
//  var body: some View {
//      NavigationView{
//          VStack(spacing: 15){
//              VStack(spacing: 5){
//                  
//                  HStack(spacing: 37){
//                      ForEach(daycalendar, id: \.self) { daycal in
//                          Text(daycal)
//                      }
//                      .foregroundColor(.gray)
//                  }
//                  
//                  VStack{
//                      TabView{
//                          calendarDay(rangeDay: 1...7)
//                          calendarDay(rangeDay: 8...14)
//                          calendarDay(rangeDay: 15...21)
//                          calendarDay(rangeDay: 22...28)
//                      }
//                      .tabViewStyle(.page(indexDisplayMode: .never))
//                      .frame(height: 30)
//                  }
//                  Text("Décembre")
//                      .font(.system(size: 20))
//                      .underline()
//                      .tracking(2)
//                  
//                  HStack{
//                      Spacer()
//                      VStack(spacing: 0) {
//                          Picker("", selection: $selctuser) {
//                              ForEach(chouser, id: \.self){ user in
//                                  Text(user)
//                              }
//                          }
//                          .tint((Color("colorButton")))
//                      }
//                  }
//              }
//              
//              HStack{
//                  Text("Vos traitements en cours :")
//                      .bold()
//                      .font(.title2)
//                      .padding()
//                  Spacer()
//              }
//              
////              List($storyTreatment, id: \.id,selection:$selection){ traitement in
////                  ExtractView(traitement: traitement)
//              }
//              .scrollContentBackground(.hidden)
//              .frame(height: 400)
//
//                  VStack{
//                  HStack(spacing: 0){
//                      NavigationLink {
//                          AddTreatmentView()
//                      } label: {
//                          Text("Ajoute un traitement")
//                              .font(.title)
//                              .foregroundColor(.black)
//                          Image(systemName: "plus.circle")
//                              .font(.system(size: 50))
//                              .foregroundColor(Color("colorButton"))
//                      }
//                  }
//                  Spacer()
//              }
//          }
//      }
//  }
////}
//#Preview {
//  AcceuilView()
//}
//
//struct calendarDay: View {
//  var rangeDay: ClosedRange<Int>
//  var body: some View {
//      HStack{
//          Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//              ForEach(rangeDay, id: \.self) { numberss in
//                  HStack{
//                      Spacer()
//                      Text(String(numberss))
//                          .font(.title3)
//                          .fontWeight(.semibold)
//                      Spacer()
//                  }
//                  .frame(width: 41)
//              }
//              
//          })
//          
//      }
//  }
//}
//
//struct ExtractView: View {
//  @Binding var traitement: Traitement
//  @State private var isExpanded: Bool = false
//  var body: some View {
//      VStack(alignment: .leading){
//          HStack{
//              Text(traitement.name)
//              Spacer()
//              Button {
//                  isExpanded.toggle()
//                  
//              } label: {
//                  Image(systemName: isExpanded ?  "chevron.up" : "chevron.down")
//              }
//              .tint(.black)
//          }
//          .frame(width: 300)
//          
//          if isExpanded{
//              VStack(alignment: .center){
//                  Text(traitement.name)
//                  Text(traitement.name)
//                  Text(traitement.name)
//                  Image(systemName: "fork.knife.circle.fill")
//              }
//          }
//      }
//      .padding()
//      .font(.title)
//      .tint(.black)
//  }
//}
