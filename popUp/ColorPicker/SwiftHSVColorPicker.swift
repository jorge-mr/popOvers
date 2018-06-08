//
//  SwiftHSVColorPicker.swift
//  popUp
//
//  Created by Jorge MR on 08/06/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

open class SwiftHSVColorPicker: UIView, ColorWheelDelegate, BrightnessViewDelegate {
    var colorWheel: ColorWheel!
    var brightnessView: BrightnessView!
    //var selectedColorView: SelectedColorView!
    
    open var color: UIColor!
    var hue: CGFloat = 1.0
    var saturation: CGFloat = 1.0
    var brightness: CGFloat = 1.0
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    open func setViewColor(_ color: UIColor) {
        var hue: CGFloat = 0.0
        var saturation: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        let ok: Bool = color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        if (!ok) {
            print("SwiftHSVColorPicker: exception <The color provided to SwiftHSVColorPicker is not convertible to HSV>")
        }
        self.hue = hue
        self.saturation = saturation
        self.brightness = brightness
        self.color = color
        setup()
    }
    
    func setup() {
        // Remove all subviews
        let views = self.subviews
        for view in views {
            view.removeFromSuperview()
        }
        
        let selectedColorViewHeight: CGFloat = 44.0
        let brightnessViewHeight: CGFloat = 26.0
        
        // let color wheel get the maximum size that is not overflow from the frame for both width and height
        let colorWheelSize = min(self.bounds.width, self.bounds.height - selectedColorViewHeight - brightnessViewHeight)
        
        // let the all the subviews stay in the middle of universe horizontally
        let centeredX = (self.bounds.width - colorWheelSize) / 2.0
        
        // Init SelectedColorView subview
        //selectedColorView = SelectedColorView(frame: CGRect(x: centeredX, y:0, width: colorWheelSize, height: selectedColorViewHeight), color: self.color)
        // Add selectedColorView as a subview of this view
        //self.addSubview(selectedColorView)
        
        // Init new ColorWheel subview
        colorWheel = ColorWheel(frame: CGRect(x: centeredX, y: 0.0, width: colorWheelSize, height: colorWheelSize), color: self.color)
        colorWheel.delegate = self
        // Add colorWheel as a subview of this view
        self.addSubview(colorWheel)
        
        // Init new BrightnessView subview
        brightnessView = BrightnessView(frame: CGRect(x: centeredX, y: colorWheel.frame.maxY, width: colorWheelSize, height: brightnessViewHeight), color: self.color)
        brightnessView.delegate = self
        // Add brightnessView as a subview of this view
        self.addSubview(brightnessView)
    }
    
    func hueAndSaturationSelected(_ hue: CGFloat, saturation: CGFloat) {
        self.hue = hue
        self.saturation = saturation
        self.color = UIColor(hue: self.hue, saturation: self.saturation, brightness: self.brightness, alpha: 1.0)
        brightnessView.indicator.fillColor = color.cgColor
        brightnessView.setViewColor(self.color)
        //selectedColorView.setViewColor(self.color)
    }
    
    func brightnessSelected(_ brightness: CGFloat) {
        print(brightness)
        self.brightness = brightness
        self.color = UIColor(hue: self.hue, saturation: self.saturation, brightness: self.brightness, alpha: 1.0)
        brightnessView.indicator.fillColor = color.cgColor
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
        
        
        colorWheel.setViewBrightness(brightness)
        // selectedColorView.setViewColor(self.color)
    }
}
