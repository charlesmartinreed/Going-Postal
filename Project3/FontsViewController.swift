//
//  FontsViewController.swift
//  Project3
//
//  Created by Charles Martin Reed on 9/4/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class FontsViewController: UITableViewController {
    
    //MARK:- Properties
    // an array of system fonts for the user to choose from, sorted
    let fonts = UIFont.familyNames.sorted()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fonts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let fontName = fonts[indexPath.row]
        
        cell.textLabel?.text = fontName
        cell.textLabel?.font = UIFont(name: fontName, size: 18)
        
        return cell
    }
}
