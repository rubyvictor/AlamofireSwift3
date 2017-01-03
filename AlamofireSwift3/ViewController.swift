//
//  ViewController.swift
//  AlamofireSwift3
//
//  Created by Victor Lee on 3/1/17.
//  Copyright © 2017 VictorLee. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!

    
    var electionsArray = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // MARK: - Setup networking for JSON
        Alamofire.request("https://newsapi.org/v1/articles?source=the-next-web&sortBy=latest&apiKey=d10ad2e138254c368ae04ad6b3c95004").responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let innerDict = dict["articles"] {
                    self.electionsArray = innerDict as! [AnyObject]
                    self.tableView.reloadData()
                }
            }
            
        }
        
        
    }

    // MARK: - Tableview data
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return electionsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let author = electionsArray[indexPath.row]["author"]
        cell.titleLabel.text = author as? String
        
        let title = electionsArray[indexPath.row]["title"]
        cell.Description.text = title as? String
        return cell
    }
    
    

}

