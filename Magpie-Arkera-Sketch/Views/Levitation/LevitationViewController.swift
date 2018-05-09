//
//  ViewController.swift
//  Magpie-Arkera-Sketch
//
//  Created by Olivier Butler on 09/05/2018.
//  Copyright © 2018 Olivier Butler. All rights reserved.
//

import UIKit

protocol LevitationViewControllerDelegate {
    func didSelectLevitate()
}

class LevitationViewController: UIViewController {

    var viewModel: LevitationViewModel!
    var delegate: LevitationViewControllerDelegate!
    var myLabel: UILabel?

    class func getInstance (viewModel: LevitationViewModel, delegate: LevitationViewControllerDelegate) -> LevitationViewController {
        let instanceOfMe = LevitationViewController()
        instanceOfMe.viewModel = viewModel
        instanceOfMe.delegate = delegate
        return instanceOfMe
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 0, y: 200, width: 375, height: 100)
        label.text = "I report on failures!"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black

        self.myLabel = label
        view.addSubview(label)
        self.view = view

        let button = UIButton()
        button.frame = CGRect(x:62, y:400, width: 250, height: 60)
        button.backgroundColor = .black
        button.setTitle("LEVITATE", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.titleLabel?.textColor = .white
        view.addSubview(button)

        button.addTarget(self, action: #selector(self.didTapLevitate), for: UIControlEvents.touchUpInside)
        self.viewModel.levitationMessage.observe(listener: { _ in
            self.updatePropertyViews()
        })
    }

    func updatePropertyViews() {
        UIView.animate(withDuration: 0.5, animations: {
            self.myLabel?.alpha = 0
        }) { _ in
            self.myLabel?.text = self.viewModel.levitationMessage.value
            UIView.animate(withDuration: 1, animations: {
                self.myLabel?.alpha = 1
            })
        }
    }

    func didSelectLevitate() {
        self.delegate.didSelectLevitate()
    }

    @objc func didTapLevitate() {
        self.didSelectLevitate()
    }

}

