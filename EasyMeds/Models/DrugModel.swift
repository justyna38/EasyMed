//
//  DrugModel.swift
//  EasyMeds
//
//  Created by Justyna Warzecha on 05/12/2023.
//

import Foundation

enum TypeMed: String {
    case cachets = "cachets"
    case sirop = "sirop"
}

struct Drug: Identifiable, Hashable {

    let id = UUID()
    let name: String
    let typeMed: TypeMed
    let expDate: String
    let quantity: Double
}

var stock: [Drug] = [Drug(name: "Doliprane", typeMed: TypeMed.cachets, expDate: "10/07/2024" , quantity: 14), Drug(name: "Advil", typeMed: TypeMed.cachets, expDate: "12/12/2023" , quantity: 14),Drug(name: "Truc", typeMed: TypeMed.sirop, expDate: "12/09/2025" , quantity: 14)
]

struct Drug2: Identifiable, Hashable {

    let id = UUID()
    let name: String
    var quantity: Double
    let dateExp: Date
    let typeMed: TypeMed
}

var stockTest: [Drug2] = [(Drug2(name: "Advil", quantity: 33, dateExp: Date.now, typeMed: TypeMed.cachets)),
                          (Drug2(name: "Doliprane", quantity: 33, dateExp: Date.now.addingTimeInterval(20000000), typeMed: TypeMed.sirop))]





