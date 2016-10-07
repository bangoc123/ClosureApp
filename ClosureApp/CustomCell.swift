//
//  CustomCell.swift
//  ClosureApp
//
//  Created by Ngoc on 9/27/16.
//  Copyright © 2016 GDG. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    
    @IBOutlet weak var uiimage: UIImageView!
    
    @IBOutlet weak var lbl_name: UILabel!
    
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    let imageCache = NSCache()
    
    var testLink: String!
    
    var imagelink: String?{
        
        
        
        didSet {
             
            self.uiimage.image = UIImage()
            
            let url = NSURL(string: imagelink!)
            
            testLink = imagelink
            
            if let imageFromCache = imageCache.objectForKey(imagelink!) as? UIImage{
                self.uiimage.image = imageFromCache
                return
            
            }
            
            NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
                if(error != nil){
                    print(error)
                    return
                
                }
                
                dispatch_async(dispatch_get_main_queue(), { 
                    () -> Void in
                    
                    let imageToCache = UIImage(data: data!)
                    
                    if self.testLink == self.imagelink{
                    
                        self.uiimage.image = imageToCache
                        
                    }
                    
                    self.imageCache.setObject(imageToCache!, forKey: self.imagelink!)
                    
                    print("Loading")
                })
                
            }.resume()
            
            
        }
    
    }
    
    
}
