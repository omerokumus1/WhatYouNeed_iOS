//
//  ObservableObject.swift
//  WhatYouNeed
//
//  Created by Ömer Faruk Okumuş on 2.06.2023.
//

import Foundation

class ObservableObject<T> {
    typealias ObserverClosure = (T) -> Void
    
    var value: T? {
        didSet {
            observers.forEach { closure in
                closure(value!) // force-unwrap because it is just set
            }
        }
    }
    
    private var observers = Array<ObserverClosure>()
    
    init(value: T) {
        self.value = value
    }
    init() {}
    
    func observeBy(closure: @escaping ObserverClosure) {
        observers.append(closure)
    }
    
    func set(value: T) {
        self.value = value
    }
}
