//
//  main.swift
//  ARC_Examples
//
//  Created by Дмитрий on 12.10.2025.
//

import Foundation

class Person {
    var name: String
    var apartment: Apartment?
    init(name: String) { self.name = name }
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    var unit: String
    weak var tenant: Person?
    init(unit: String) { self.unit = unit }
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person? = Person(name: "John Appleseed")
var unit4: Apartment? = Apartment(unit: "4A")

john!.apartment = unit4
unit4!.tenant = john

john = nil
unit4 = nil

class ViewModel {
    var onUpdate: (() -> Void)?
    func loadData() {
        onUpdate = {
            print(self)
        }
    }
}
