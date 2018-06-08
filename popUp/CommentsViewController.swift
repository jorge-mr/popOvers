//
//  CommentsViewController.swift
//  popUp
//
//  Created by Jorge MR on 05/06/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var students = ["Lorem ipsum","dolor sit","amet consectetur","adipisicing elit"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let popoverHeight = self.view.frame.height - 80
        preferredContentSize = CGSize(width: 280, height: popoverHeight)
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didSelectInviteStudent(_ sender: UIButton) {
    }
    
    @IBAction func didSelectSegmentedControl(_ sender: CustomSegmentedControl) {
        print(sender.selectedSegmentedIndex)
    }
    
}

extension CommentsViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentID", for: indexPath) as! StudentTableViewCell
        cell.studentName.text = students[indexPath.row]
        return cell
    }
}
