//
//  ViewController.swift
//  Chapter6ProgrammaticLayoutMargins
//
//  Created by Herve Desrosiers on 2020-03-06.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let margin: CGFloat = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func changeNestedMargins(inset: CGFloat) { // make it work back to iOS9...
        if #available(iOS 11, *) {
            nestedView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        } else {
            nestedView.layoutMargins = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        }
    }
    
    private func setupView() {
        view.addSubview(nestedView)
        changeNestedMargins(inset: margin)
        NSLayoutConstraint.activate([
            nestedView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nestedView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            nestedView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            nestedView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    private let nestedView: NestedView = {
        let view = NestedView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()

}

