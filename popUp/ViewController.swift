//
//  ViewController.swift
//  popUp
//
//  Created by Jorge MR on 05/06/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorsButton: UIButton!
    @IBOutlet weak var commentsButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

}

