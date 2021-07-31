//
//  ViewController.swift
//  LoopingTransform
//
//  Created by Ahmed Khalaf on 31/07/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var rotatingView: UIView!
    private var angle: CGFloat = 0
    private let speed: CGFloat = 0.05

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        CADisplayLink(target: self, selector: #selector(handleDisplayLink)).add(to: .main, forMode: .common)
    }
    
    @objc private func handleDisplayLink() {
        rotatingView.layer.transform = CATransform3DMakeRotation(angle, 0, 1, 0)
        angle = (angle + speed).truncatingRemainder(dividingBy: .pi * 2)
    }
}

