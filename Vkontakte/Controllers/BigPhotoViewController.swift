//
//  BigPhotoViewController.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 12.07.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class BigPhotoViewController: UIViewController {
    
    var photos: [UIImage?] = []
    var currentIndex: Int?
    var photosCount: Int?
    
    var animator: UIViewPropertyAnimator!
    
    enum Direction {
        case left, right
        
        init(x: CGFloat) {
            self = x > 0 ? .right : .left
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoCountLabel: UILabel!
    
    lazy var nextImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = photos[currentIndex!]
        nextImageView.contentMode = .scaleAspectFit
        photosCount = photos.count
        photoCountLabel.text = "\(currentIndex! + 1) из \(photosCount!)"
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(onPan))
        view.addGestureRecognizer(pan)
    }

    @objc func onPan(_ sender: UIPanGestureRecognizer) {
        guard let panView = sender.view else { return }
        
        let translation = sender.translation(in: panView)
//        print(translation.x)
        let direction = Direction(x: translation.x)
//        print(direction)

        switch sender.state {

        case .began:
//            print("began")
            animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
                self.imageView.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                self.imageView.alpha = 0
            })
            animator.pauseAnimation()

            if canSlide(direction) {
                let nextIndex = direction == .left ? currentIndex! + 1 : currentIndex! - 1
                photoCountLabel.text = "\(nextIndex + 1) из \(photosCount!)"
                nextImageView.image = photos[nextIndex]
                view.addSubview(nextImageView)
                let offsetX = direction == .left ? view.bounds.width : -view.bounds.width
                nextImageView.frame = view.bounds.offsetBy(dx: offsetX, dy: 0)

                animator.addAnimations({
                    self.nextImageView.center = self.imageView.center
                    self.nextImageView.alpha = 1
                }, delayFactor: 0.15)
            }

            animator.addCompletion { (position) in
                guard position == .end else { return }
                self.currentIndex = direction == .left ? self.currentIndex! + 1 : self.currentIndex! - 1
                self.imageView.alpha = 1
                self.imageView.transform = .identity
                self.imageView.image = self.photos[self.currentIndex!]
                self.nextImageView.removeFromSuperview()
            }
            animator.pauseAnimation()

        case .changed:
//            print("changed")
            animator.fractionComplete = abs(translation.x) / panView.frame.width

        case .ended:
//            print("ended")
            if canSlide(direction), animator.fractionComplete > 0.5 {
                animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
            } else {
                animator.stopAnimation(true)
                UIView.animate(withDuration: 0.25) {
                    self.imageView.transform = .identity
                    self.imageView.alpha = 1
                    let offsetX = direction == .left ? self.view.bounds.width : -self.view.bounds.width
                    self.nextImageView.frame = self.view.bounds.offsetBy(dx: offsetX, dy: 0)
                }
            }

        default:
            break
        }
    }

    func canSlide(_ direction: Direction) -> Bool {
        if direction == .left {
            return currentIndex! < photos.count - 1
        } else {
            return currentIndex! > 0
        }
    }

}
