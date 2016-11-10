//
//  ViewController.swift
//  TinderApp
//
//  Created by Neha Samant on 11/9/16.
//  Copyright © 2016 Neha Samant. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {


    @IBOutlet weak var draggableImageView: DraggableImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        draggableImageView.image = UIImage(named: "ryan")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

