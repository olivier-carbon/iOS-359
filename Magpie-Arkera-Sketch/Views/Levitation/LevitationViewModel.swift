//
//  LevitationViewModel.swift
//  Magpie-Arkera-Sketch
//
//  Created by Olivier Butler on 09/05/2018.
//  Copyright © 2018 Olivier Butler. All rights reserved.
//

import Foundation

class LevitationViewModel {
    // Need to figure out how we deal with complex state
    var levitationMessage: Observable<String> = Observable("I report on Levitation State, of which there is none")
    private var levitationModel: LevitationModel!

    init (levitationModel: LevitationModel) {
        self.levitationModel = levitationModel
        levitationModel.state.observe(listener: { (result:Bool?) in
            self.setMessage(levitationState: result)
        })
    }

    private func setMessage (levitationState:Bool?) {
        var message = "I report on Levitation State, of which there is none"
        if let levitationState = levitationState {
            message = levitationState ? "Up Up and AWAY" : "You done the bad levetating"
        }
        self.levitationMessage.value = message
    }
}
