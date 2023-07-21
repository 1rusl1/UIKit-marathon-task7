//
//  ViewController.swift
//  UIKit-marathon-task-7
//
//  Created by Руслан Сабиров on 21/07/2023.
//

import UIKit


class ViewController: UIViewController, UIScrollViewDelegate {
    private let imageHeight: CGFloat = 270

    private lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1000)
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.backgroundColor = .white
        scrollView.delegate = self
        return scrollView
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "image"))
        imageView.frame = CGRect(
            origin: .zero,
            size: .init(
                width: view.bounds.size.width,
                height: imageHeight
            )
        )
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = scrollView
        scrollView.addSubview(imageView)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = appearance
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let height = imageHeight - scrollView.contentOffset.y
        imageView.frame = CGRect(x: 0, y: scrollView.contentOffset.y, width: view.bounds.size.width, height: height)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = imageHeight - scrollView.contentOffset.y
        imageView.frame = CGRect(x: 0, y: scrollView.contentOffset.y, width: view.bounds.size.width, height: height)
        let topInset = max(height, imageHeight) - view.safeAreaInsets.top
        scrollView.verticalScrollIndicatorInsets = .init(top: topInset, left: 0, bottom: 0, right: 0)
    }
}
