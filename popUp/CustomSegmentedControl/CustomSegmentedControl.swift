//
//  CustomSegmentedControl.swift
//  popUp
//
//  Created by Jorge MR on 06/06/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

@IBDesignable
class CustomSegmentedControl: UIControl {
    
    var buttons = [UIButton]()
    var selector: UIView!
    var selectedSegmentedIndex = 0
    
    @IBInspectable
    var borderWidth : CGFloat = 0 {
        didSet {
//            layer.borderWidth = borderWidth
            updateView()
        }
    }
    
//    @IBInspectable
//    var borderColor : UIColor = UIColor.clear {
//        didSet {
//            layer.borderColor = borderColor.cgColor
//        }
//    }
    
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
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
        let selectorWidth = self.frame.width / CGFloat(buttons.count)
        selector = UIView(frame: CGRect(x: -1, y: -1, width: selectorWidth+1, height: frame.height+2))
        selector.layer.cornerRadius = 1
        selector.layer.borderWidth = borderWidth
        selector.layer.borderColor = selectorBorderColor.cgColor
        self.addSubview(selector)
        
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
        updateView()
    }
    
    @objc func buttonTapped(button: UIButton){
        for (btnIndex,btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == button {
                selectedSegmentedIndex = btnIndex
                let selectorStartPosition = frame.width/CGFloat(buttons.count) * CGFloat(btnIndex)
                UIView.animate(withDuration: 0.3) {
                    self.selector.frame.origin.x = selectorStartPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
        sendActions(for: .valueChanged)
    }
}
