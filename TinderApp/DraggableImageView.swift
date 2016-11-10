//
//  DraggableImageView.swift
//  TinderApp
//
//  Created by Neha Samant on 11/10/16.
//  Copyright © 2016 Neha Samant. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var initialImageViewCenter: CGPoint!
    var reverseRotation = false
    
    var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        
        imageView.isUserInteractionEnabled = true
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
    }
    

    @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            initialImageViewCenter = imageView.center
            reverseRotation = sender.location(in: self).y > frame.height / 2
        case .changed:
            let translation = sender.translation(in: self)
            var offset = translation.x
            if translation.x > 100 {
                offset = 360
            } else if translation.x < -100 {
                offset = -360
            }
            imageView.transform = CGAffineTransform(translationX: offset, y: 0)
            let angle = (translation.x / 1440) * CGFloat(M_PI)
            imageView.transform =
                imageView.transform.rotated(by: reverseRotation ? -angle : angle)
        case .ended:
            imageView.transform = CGAffineTransform.identity
        default:
            break
        }

    }
}
