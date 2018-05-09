//
//  LevitationCoordinator.swift
//  Magpie-Arkera-Sketch
//
//  Created by Olivier Butler on 09/05/2018.
//  Copyright © 2018 Olivier Butler. All rights reserved.
//

import UIKit

class MyCoordinator {

    var navigationController: UINavigationController?
    var levitationModel: LevitationModel = LevitationModel()

    func levitate() {
        print("Here we go, levitation incoming")
        self.levitationModel.attemptToLevitate()
    }

    func start() {
        self.navigationController = UINavigationController(rootViewController: WelcomeViewController.getInstance(delegate: self))
        UIApplication.shared.keyWindow?.rootViewController = self.navigationController
    }

    func moveToLevitationPage()  {
        let viewModel = LevitationViewModel(levitationModel: self.levitationModel)
        let levitationViewController = LevitationViewController.getInstance(viewModel: viewModel, delegate: self)
        self.navigationController?.pushViewController(levitationViewController, animated: true)
    }

}

extension MyCoordinator: LevitationViewControllerDelegate {
    func didSelectLevitate() {
        print("Selected to Levitate")
        self.levitate()
    }
}

extension MyCoordinator: WelcomeViewControllerDelegateProtocol {

    func handleViewTap() {
        self.moveToLevitationPage()
    }

}
