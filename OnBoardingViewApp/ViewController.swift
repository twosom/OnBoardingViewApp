//
//  ViewController.swift
//  OnBoardingViewApp
//
//  Created by Hope on 2021/12/12.
//
//

import UIKit


class ViewController: UIViewController {

    var didShowOnBoardingView: Bool = false

    override
    func viewDidLoad() {
        super.viewDidLoad()

    }

    override
    func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !didShowOnBoardingView {
            let pageVC: OnBoardingPageViewController = OnBoardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)

            pageVC.modalPresentationStyle = .fullScreen
            present(pageVC, animated: true)
            didShowOnBoardingView = true
        }


    }
}
