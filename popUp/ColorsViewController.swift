//
//  ColorsViewController.swift
//  popUp
//
//  Created by Jorge MR on 05/06/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var pointIndicator: UIView!
    @IBOutlet var colorButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = CGSize(width: 320, height: 311.5)
        setupSlider()
        setupColorButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupSlider(){
        slider.minimumValue = 0.1
        slider.maximumValue = 1.0
        slider.value = 0.5
        resizePointIndicator(value: 0.5)
    }
    
    func setupColorButtons(){
        for button in colorButtons {
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.borderWidth = 2.0
        }
        
    }
    
    @IBAction func sliderDidMove(_ sender: UISlider) {
        resizePointIndicator(value: sender.value)
    }
    
    func resizePointIndicator(value: Float){
        let width = CGFloat(value) * 50
        pointIndicator.bounds.size = CGSize(width: width, height: width)
        pointIndicator.clipsToBounds = true
        pointIndicator.layer.cornerRadius = width / 2
    }
    
    @IBAction func didSelectColor(_ sender: UIButton) {
        for button in colorButtons {
            button.layer.borderColor = UIColor.white.cgColor
        }
        sender.layer.borderColor = UIColor.black.cgColor
        pointIndicator.backgroundColor = sender.backgroundColor
    }
}
