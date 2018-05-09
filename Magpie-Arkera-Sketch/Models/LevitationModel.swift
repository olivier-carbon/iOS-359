//
//  LevitationModel.swift
//  Magpie-Arkera-Sketch
//
//  Created by Olivier Butler on 09/05/2018.
//  Copyright © 2018 Olivier Butler. All rights reserved.
//

import Foundation

protocol LevitationServiceProtocol {
    func attemptToLevitate ()
}

protocol LevitationModelProtocol {
    var state: Observable<Bool?> { get }
    func attemptToLevitate ()
}

class LevitationModel: LevitationModelProtocol {

    var state: Observable<Bool?> = Observable(nil)
    private var levitationService: LevitationService = LevitationService()

    func attemptToLevitate() {
        self.levitationService.levitateApiCall { (result: Bool?) in
            print("BOOOM")
            var newValue = false
            if let currentValue = self.state.value {
                newValue = !currentValue
            }
            self.state.value = newValue
        }
    }
}

class LevitationService: LevitationServiceProtocol {

    var levitationResult: Observable<Bool?> = Observable(nil)

    func attemptToLevitate () {
        print("service is attempting to levitate")
        self.levitateApiCall { (result:Bool?) in
            self.levitationResult.value = result
        }
    }

    func levitateApiCall (_ completionHandler: @escaping (_:Bool?) -> Void){
        print("wait for it")
        Utils.runOnMainAfterDelay(1, block: {
            completionHandler(false)
        })
    }

}
