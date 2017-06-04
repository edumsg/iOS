//
//  list content.swift
//  edu
//
//  Created by nadin hossam el din hamdy elsaeed on 5/14/17.
//  Copyright © 2017 nadin hossam el din hamdy elsaeed. All rights reserved.
//

import UIKit

class list_content: UITableViewController {
    let replies=["sorry","good luck ","i'm felling so good "," how are you feeling now ?!?","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad","sdasdsad"]
    
    let  names=["sara","mohamed","mohamed","ahmed","mohamed","sara","sara","adam","mohamed","sara","adam","mohamed","sara","adam","mohamed","sara","adam","mohamed","sara","adam","mohamed","sara","adam"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        
    {
        return(replies.count)
    }
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as!ViewControllerTableViewCell
        let at = "@"
            cell.lTweet.text = replies[indexPath.row]
            cell.lHandle.text = at.appending(names[indexPath.row])
            cell.lName.text = names[indexPath.row]
            
            return (cell)}

}
