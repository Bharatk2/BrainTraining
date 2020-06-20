//
//  DrawingImageView.swift
//  BrainTrainingApp
//
//  Created by Bhawnish Kumar on 6/19/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import UIKit

class DrawingImageView: UIImageView {

    weak var delegate: ViewController?
    var currentTouchPosition: CGPoint?

    func draw(from start: CGPoint, to end: CGPoint) {
        let renderer = UIGraphicsImageRenderer(size: bounds.size)
        image = renderer.image { ctx in
                image?.draw(in: bounds)

                UIColor.black.setStroke()
                ctx.cgContext.setLineCap(.round)
                ctx.cgContext.setLineWidth(15)

                ctx.cgContext.move(to: start)
                ctx.cgContext.addLine(to: end)
                ctx.cgContext.strokePath()
            }

     
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        currentTouchPosition = touches.first?.location(in: self)
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
