//
//  ViewController.swift
//  StretchingPictureTask
//
//  Created by Andrii's Macbook  on 20.09.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    private let scrollView = UIScrollView()
    private var imageView: UIImageView!
    private let originalImageHeight: CGFloat = 270.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupImageView()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.delegate = self
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height + 500)
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: originalImageHeight, left: 0, bottom: 0, right: 0)
    }
    
    private func setupImageView() {
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: originalImageHeight))
        imageView.image = UIImage(named: "image")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        scrollView.addSubview(imageView)
        
        let contentView = UIView(frame: CGRect(x: 0, y: originalImageHeight, width: view.bounds.width, height: view.bounds.height + 500))
        contentView.backgroundColor = .white
        scrollView.addSubview(contentView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        if yOffset < 0 {
            imageView.frame = CGRect(x: 0, y: yOffset, width: view.frame.width, height: originalImageHeight - yOffset)
            scrollView.scrollIndicatorInsets = UIEdgeInsets(top: originalImageHeight - yOffset, left: 0, bottom: 0, right: 0)
        } else {
            imageView.frame.origin.y = -yOffset
            scrollView.scrollIndicatorInsets = UIEdgeInsets(top: originalImageHeight - yOffset, left: 0, bottom: 0, right: 0)
        }
    }
}

