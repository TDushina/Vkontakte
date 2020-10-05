//
//  GradientView.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 05.07.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

//@IBDesignable
class GradientView: UIView {
    
//    @IBInspectable
    var firstColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
//    @IBInspectable
    var secondColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView()  {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [UIColor.systemBlue.cgColor, UIColor.white.cgColor]
        layer.locations = [0 as NSNumber, 1 as NSNumber]
        layer.startPoint = CGPoint.zero
        layer.endPoint = CGPoint(x: 1, y: 0)
        
    }
}
