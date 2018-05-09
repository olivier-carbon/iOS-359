//
//  WelcomeViewController.swift
//  Magpie-Arkera-Sketch
//
//  Created by Olivier Butler on 09/05/2018.
//  Copyright © 2018 Olivier Butler. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    var delegate: WelcomeViewControllerDelegateProtocol!

    class func getInstance (delegate: WelcomeViewControllerDelegateProtocol) -> WelcomeViewController {
        guard let instanceOfMe = UIStoryboard(name: "WelcomeViewController", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else {
            fatalError("Couldn't do the thing")
        }
        instanceOfMe.delegate = delegate
        return instanceOfMe
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapView(_ sender: Any) {
        self.delegate.handleViewTap()
    }

}

protocol WelcomeViewControllerDelegateProtocol {
    func handleViewTap()
}
