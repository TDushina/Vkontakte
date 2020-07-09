//
//  LoadingView.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 09.07.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    let dotsCount: Int = 3
    var dotHeight: CGFloat = 20
    let animationDuration: TimeInterval = 1
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    var dotViews: [UIView] = []
    
    func createDotView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            stackView.heightAnchor.constraint(equalToConstant: dotHeight)
        ])
        
        (1...dotsCount).forEach { _ in
            let dot = createDotView()
            stackView.addArrangedSubview(dot)
            NSLayoutConstraint.activate([
                dot.heightAnchor.constraint(equalToConstant: dotHeight),
                dot.widthAnchor.constraint(equalToConstant: dotHeight)
            ])
            dot.layer.cornerRadius = dotHeight / 2
            dotViews.append(dot)
        }
    }
    
    func startAnimation() {
        dotViews.forEach { $0.alpha = 1 }
        
        let step = animationDuration / Double(dotsCount)
        
        (0...dotsCount - 1).forEach {
            let dot = dotViews[$0]
            UIView.animate(
                withDuration: animationDuration,
                delay: step * Double($0),
                options: [.repeat],
                animations: {
                    dot.alpha = 0
            },
                completion: nil
            )
        }
    }
    
    func stopAnimation() {
        dotViews.forEach {
            $0.layer.removeAllAnimations()
        }
    }

}
