//
//  OnBoardingItemViewController.swift
//  OnBoardingViewApp
//
//  Created by Hope on 2021/12/12.
//

import UIKit

class OnBoardingItemViewController: UIViewController {

    var mainText = ""
    var subText = ""
    var topImage: UIImage?

    @IBOutlet
    private var topImageView: UIImageView!

    @IBOutlet
    private var mainTitleLabel: UILabel! {
        didSet {
            mainTitleLabel.font = .systemFont(ofSize: 31, weight: .light)
        }
    }

    @IBOutlet
    private var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = .systemFont(ofSize: 17, weight: .light)
            descriptionLabel.textColor = .systemGray2
        }
    }

    override
    func viewDidLoad() {
        super.viewDidLoad()
        mainTitleLabel.text = mainText
        descriptionLabel.text = subText
        if let topImage: UIImage = topImage {
            topImageView.image = topImage
        }


    }


}
