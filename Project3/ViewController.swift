//
//  ViewController.swift
//  Project3
//
//  Created by Charles Martin Reed on 9/4/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
    
    //MARK:- @IBOutlets
    @IBOutlet weak var postcard: UIImageView!
    @IBOutlet weak var colorSelection: UICollectionView!
    
    //MARK:- Properties
    var colors = [UIColor]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //we'll first fill our colors array with standard system color and then use a for loop to fill it with additional hues and saturations
        colors += [.black, .gray, .white, .orange, .red, .magenta, .purple, .blue, .cyan, .green]
        
        for i in 0...9 {
            for j in 1...10 {
                
                //at instance 1 it'll be 0/10 for hue and 1/10 for saturation, then 1/10 and 2/10
                let color = UIColor(hue: CGFloat(i) / 10, saturation: CGFloat(j) / 10, brightness: 1, alpha: 1)
                colors.append(color)
            }
        }
    }
    
    //MARK:- Collection view delegate methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //we'll make a collection item and fill it with the color
        //dequeue a reusable cell using the "Cell" reuse identifier
        //give it a background color from the colors array, a 1 point border using the default black color and round the corners
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        cell.backgroundColor = colors[indexPath.row]
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        
        return cell
    }

}

