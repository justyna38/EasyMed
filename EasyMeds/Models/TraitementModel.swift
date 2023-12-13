//
//  TraitementModel.swift
//  EasyMeds
//
//  Created by Justyna Warzecha on 05/12/2023.
//

import Foundation

//enum Meal{
//    case breakfast, lunch, dinner
//}

//struct Traitement {
//    let name: String
//    let drug: Drug
//    let start: Date
//    let end: Date
//    let meal: Meal
//    let hour: Date
//    let posology: Int
//    let duration: Int
//}
//
//let storyTreatment: [Traitement] = [
//
//]

struct Traitement: Identifiable {
    let id = UUID()
    let name: String
    let drug: Drug2
    let start: Int
    let duration: Int
    let meal: Bool
    let matin: Bool
    let midi: Bool
    let soir: Bool
    let posology: Int
//    var isTaken: Bool
}

var storyTreatment: [Traitement] = [(Traitement(name: "Grippe", drug: stockTest[1], start: 1, duration: 2, meal: true, matin: true, midi: true, soir: true, posology: 4))

]
