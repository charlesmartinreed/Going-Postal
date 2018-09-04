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
    var image: UIImage?
    
    //dummy data, the user will be able to customize this
    var topText = "Visit London"
    var topFontName = "Helvetica Neue"
    var topColor = UIColor.white
   
    var bottomText = "Home of Sherlock Holmes, Paddington Bear and James Bond"
    var bottomFontName = "Helvetica Neue"
    var bottomColor = UIColor.white
    
    
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
        
        //calling our postcard method
        renderPostcard()
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
    
    //MARK:- Function for drawing our postcard
    func renderPostcard() {
        //define the total drawing space
        let drawRect = CGRect(x: 0, y: 0, width: 3000, height: 2400)
        
        //define where to draw the top and bottom text
        let topTextRect = CGRect(x: 250, y: 200, width: 2500, height: 800)
        let bottomTextRect = CGRect(x: 250, y: 1800, width: 2500, height: 600)
        
        //create UIFont instances out of the font names, providing failbacks as failure
        let topFont = UIFont(name: topFontName, size: 350) ?? UIFont.systemFont(ofSize: 250)
        let bottomFont = UIFont(name: bottomFontName, size: 150) ?? UIFont.systemFont(ofSize: 100)
        
        //create a centered paragraph style
        let centered = NSMutableParagraphStyle()
        centered.alignment = .center
        
        //Wrap that in attributed strings with the user's colors
        let topTextAttributes: [NSAttributedStringKey : Any] = [.foregroundColor: topColor, .font: topFont, .paragraphStyle: centered]
        let bottomTextAttributes: [NSAttributedStringKey: Any] = [.foregroundColor: bottomColor, .font: bottomFont, .paragraphStyle: centered]
        
        // start rendering at the correct size
        let renderer = UIGraphicsImageRenderer(size: drawRect.size)
        postcard.image = renderer.image(actions: { ctx in
            
            //fill the entire screen in gray
            UIColor.gray.set()
            ctx.fill(drawRect)
            
            // draw the user's image at the top left corner
            image?.draw(at: CGPoint(x: 0, y: 0))
            
            //draw the top and bottom text
            topText.draw(in: topTextRect, withAttributes: topTextAttributes)
            bottomText.draw(in: bottomTextRect, withAttributes: bottomTextAttributes)
        })
    }

}

