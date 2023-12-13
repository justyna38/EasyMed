//
//  UserModel.swift
//  EasyMeds
//
//  Created by Justyna Warzecha on 05/12/2023.
//

import Foundation

struct User {
    let firstName: String
    let lastName: String
    let age: Int
    let mail: String
    let phoneNumber: String
    let familyMember: [FamilyMember]
    let medicament: [Drug]
}


