//
//  FontsViewController.swift
//  Project3
//
//  Created by Charles Martin Reed on 9/4/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit
import MobileCoreServices

class FontsViewController: UITableViewController, UITableViewDragDelegate {
    
    //MARK:- Properties
    // an array of system fonts for the user to choose from, sorted
    let fonts = UIFont.familyNames.sorted()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dragDelegate = self
        title = "Fonts"
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
    
    //MARK:- Table View drag delegate method
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        //item - NSItemProvider - Drag Item
        //remember to import MobileCoreServices for the 
        
        //must convert string to a data item and then to a NSData item
        let string = fonts[indexPath.row]
        guard let data = string.data(using: .utf8) else { return [] } //decline drag/drop
        
        let itemProvider = NSItemProvider(item: data as NSData, typeIdentifier: kUTTypePlainText as String)
        
        return [UIDragItem(itemProvider: itemProvider)]
    }
    
}
