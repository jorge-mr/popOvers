//
//  ViewController.swift
//  popUp
//
//  Created by Jorge MR on 05/06/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BrightnessViewDelegate {

    @IBOutlet weak var colorPicker: SwiftHSVColorPicker!
    @IBOutlet weak var myview: UIView!
    @IBOutlet weak var colorsButton: UIButton!
    @IBOutlet weak var commentsButton: UIButton!
    
    // Init ColorPicker with yellow
    var selectedColor: UIColor = UIColor.white
    private let shapeLayer = CAShapeLayer()
    var brightnessView: BrightnessView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup Color Picker
        colorPicker.setViewColor(selectedColor)
        colorPicker.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1.0)
        
        
        //Shape layer
        myview.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1.0)
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1.0).cgColor
        myview.layer.addSublayer(shapeLayer)
        
        let p1 = CGPoint(x: 0.0, y: (myview.frame.height/2)-2.0)
        let p2 = CGPoint(x: myview.frame.width - 3.0, y: 1.0)
        let p3 = CGPoint(x: myview.frame.width - 1.0, y: 1.0)
        let p4 = CGPoint(x: myview.frame.width, y: 3.0)
        let p5 = CGPoint(x: myview.frame.width, y: myview.frame.height - 3.0)
        let p6 = CGPoint(x: myview.frame.width - 1.0, y: myview.frame.height - 1.0)
        let p7 = CGPoint(x: myview.frame.width - 2.5, y: myview.frame.height - 1.0)
        let p8 = CGPoint(x: 0.0, y: (myview.frame.height/2)+2.0)
        let p9 = CGPoint(x: -2.0, y: myview.frame.height/2)
        //triangular
        //        let bezierPath = UIBezierPath()
        //        bezierPath.move(to: CGPoint(x: 0.0, y: (myview.frame.height / 2)-3))
        //        bezierPath.addLine(to: CGPoint(x: myview.frame.width, y: 0.0))
        //        bezierPath.addLine(to: CGPoint(x: myview.frame.width, y: myview.frame.height))
        //        bezierPath.addLine(to: CGPoint(x: 0.0, y: (myview.frame.height / 2)+3))
        //        bezierPath.close()
        
        //Curveado
        let bezierPath = UIBezierPath()
        bezierPath.move(to: p1)
        bezierPath.addLine(to: p2)
        bezierPath.addCurve(to: p4, controlPoint1: p2, controlPoint2: p3)
        bezierPath.addLine(to: p5)
        bezierPath.addCurve(to: p7, controlPoint1: p5, controlPoint2: p6)
        bezierPath.addLine(to: p8)
        bezierPath.addCurve(to: p1, controlPoint1: p8, controlPoint2: p9)
        bezierPath.close()
        shapeLayer.path = bezierPath.cgPath
        
        //Slider <1
        brightnessView = BrightnessView(frame: CGRect(x: 0, y: myview.frame.height / 4, width: myview.frame.width, height: myview.frame.height), color: UIColor.clear)
        brightnessView.indicator.fillColor = UIColor(red: 88/255, green: 88/255, blue: 88/255, alpha: 1.0).cgColor
        brightnessView.delegate = self
        myview.addSubview(brightnessView)
        brightnessView.colorLayer.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "commentsSegue" {
            let destinationVC = segue.destination as! CommentsViewController
            destinationVC.popoverPresentationController?.sourceRect = commentsButton.bounds
        }else if segue.identifier == "colorsSegue" {
            let destinationVC = segue.destination as! ColorsViewController
            destinationVC.popoverPresentationController?.sourceRect = colorsButton.bounds
        }
    }
    
    func brightnessSelected(_ brightness: CGFloat) {
        print(brightness)
        brightnessView.indicator.shadowColor = UIColor.gray.cgColor
        brightnessView.indicator.shadowRadius = 5
        brightnessView.indicator.shadowOpacity = 1
        let contactShadowSize: CGFloat = 38
        let shadowPath = CGPath(ellipseIn: CGRect(x: brightnessView.point.x - 18,
                                                  y: brightnessView.point.y - 14,
                                                  width: 38,
                                                  height: contactShadowSize),
                                transform: nil)
        
        brightnessView.indicator.shadowPath = shadowPath
    }
    
    func getSelectedColor(_ sender: UIButton) {
        // Get the selected color from the Color Picker.
        let selectedColor = colorPicker.color
        
        print(selectedColor!)
    }

}

