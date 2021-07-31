//
//  ViewController.swift
//  LoopingTransform
//
//  Created by Ahmed Khalaf on 31/07/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var rotatingView1: UIView!
    @IBOutlet private weak var rotatingView2: UIView!
    private var angle: CGFloat = 0
    private let speed: CGFloat = 0.05

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        CADisplayLink(target: self, selector: #selector(handleDisplayLink)).add(to: .main, forMode: .common)
        
        let animation = CABasicAnimation(keyPath: "transform.rotation.y")
        animation.fromValue = 0
        animation.toValue = CGFloat.pi * 2
        animation.repeatCount = .infinity
        animation.speed = Float(speed)
        rotatingView2.layer.add(animation, forKey: "rotate")
    }
    
    @objc private func handleDisplayLink() {
        rotatingView1.layer.transform = CATransform3DMakeRotation(angle, 0, 1, 0)
        angle = (angle + speed).truncatingRemainder(dividingBy: .pi * 2)
    }
}

