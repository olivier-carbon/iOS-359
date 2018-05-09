//
//  SwiftCore.swift
//  Magpie-Arkera-Sketch
//
//  Created by Olivier Butler on 09/05/2018.
//  Copyright © 2018 Olivier Butler. All rights reserved.
//

import Foundation

class Utils {

    class func runOnMainAfterDelay(_ delay: Double, block: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: block)
    }

}

class Observable<T> {

    typealias Listener = (T) -> Void
    var listeners: [Listener] = []

    var value: T {
        didSet {
            self.emit()
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func observe(listener: @escaping Listener) {
        self.listeners.append(listener)
        listener(self.value)
    }

    func emit() {
        for listener in self.listeners {
            listener(self.value)
        }
    }

}
