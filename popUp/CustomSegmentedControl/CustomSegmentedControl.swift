//
//  CustomSegmentedControl.swift
//  popUp
//
//  Created by Jorge MR on 06/06/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

@IBDesignable
class CustomSegmentedControl: UIView {
    
    var buttons = [UIButton]()
    var selector: UIView!
    
    @IBInspectable
    var borderWidth : CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var borderColor : UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    var commaSeparatedButtonTitles : String = "" {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var textColor : UIColor = .lightGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var selectorBorderColor : UIColor = .blue {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var selectorTextColor : UIColor = .lightGray {
        didSet {
            updateView()
        }
    }
    
    func updateView(){
        buttons.removeAll()
        subviews.forEach{$0.removeFromSuperview()}
        let buttonsTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
        for buttonTitle in buttonsTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            buttons.append(button)
        }
        let selectorWidth = frame.width / CGFloat(buttonsTitles.count)
        selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height))
        selector.layer.cornerRadius = 1
        selector.layer.borderWidth = borderWidth
        selector.layer.borderColor = selectorBorderColor.cgColor
        addSubview(selector)
        let stackV = UIStackView(arrangedSubviews: buttons)
        stackV.axis = .horizontal
        stackV.alignment = .fill
        stackV.distribution = .fillEqually
        addSubview(stackV)
        stackV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackV.topAnchor.constraint(equalTo: self.topAnchor),
        stackV.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        stackV.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        stackV.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
    }
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = 1
    }
    
}
