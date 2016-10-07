//
//  ViewController.swift
//  ClosureApp
//
//  Created by Ngoc on 9/27/16.
//  Copyright © 2016 GDG. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    
    var modelData = [
                     ["name": "Gigi Hadid", "body": "60-90-60", "image" : "http://hbz.h-cdn.co/assets/16/22/480x720/hbz-half-up-pony-gigi-hadid.jpg"],
                     ["name": "Julianne Hough", "body": "60-90-60", "image" : "http://hbz.h-cdn.co/assets/cm/15/03/480x720/54bc330fcceb1_-_hbz-half-hair-bun-julianne-hough-fameflynet.jpg"],
                     ["name": "Amy Adams", "body": "60-90-60", "image" : "http://hbz.h-cdn.co/assets/cm/15/03/480x720/54bc32e1dba49_-_hbz-half-bun-kate-middleton.jpg"],
                     ["name": "Duchess", "body": "60-90-60", "image" : "http://hbz.h-cdn.co/assets/16/38/480x720/hbz-street-style-nyfw-ss2017-day6-36.jpg"],
                     ["name": "Hadid", "body": "60-90-60", "image" : "http://hbz.h-cdn.co/assets/16/38/480x720/hbz-gigi-best-hair-2014-gettyimages-459470704.jpg"],
                     ["name": "Vanity", "body": "60-90-60", "image" : "http://hbz.h-cdn.co/assets/16/38/480x720/hbz-gigi-best-hair-2014-gettyimages-476532435.jpg"],
                     ["name": "Claire Danes", "body": "60-90-60", "image" : "http://hbz.h-cdn.co/assets/16/38/480x720/hbz-gigi-best-hair-2015-gettyimages-469725048.jpg"],
                     ["name": "Jenie", "body": "60-90-60", "image" : "http://hbz.h-cdn.co/assets/16/38/480x720/hbz-gigi-best-hair-2015-gettyimages-496670864.jpg"],
                     ["name": "Jenie", "body": "60-90-60", "image" : "http://hbz.h-cdn.co/assets/16/38/480x720/hbz-gigi-best-hair-2015-gettyimages-498329418.jpg"],
                     ["name": "Jessica Alba", "body": "60-90-60", "image" : "http://hbz.h-cdn.co/assets/16/37/480x720/hbz-sexy-hairstyles-jessica-alba.jpg"],
                     ["name": "Taylor Swift", "body": "60-90-60", "image" : "http://hbz.h-cdn.co/assets/16/37/480x720/hbz-sexy-hairstyles-taylor-swift.jpg"],
                     ["name": "Lily Aldridge", "body": "60-90-60", "image" : "http://hbz.h-cdn.co/assets/16/37/480x720/hbz-sexy-hairstyles-lily-aldridge.jpg"],
                     ["name": "​Sienna Miller", "body": "60-90-60", "image" : "http://hbz.h-cdn.co/assets/16/34/480x720/hbz-strawberry-blonde-christina-hendricks.jpg"],
                     ["name": "​Amy Adams", "body": "60-90-60", "image" : "http://hbz.h-cdn.co/assets/16/31/480x720/hbz-auburn-hair-amy-adams.jpg"],
                     ["name": "​Priyanka Chopra", "body": "60-90-60", "image" : "http://hbz.h-cdn.co/assets/16/33/480x720/gallery-1471449329-hbz-the-list-rope-braids-priyanka-chopra.jpg"],
                     ["name": "​Ciara", "body": "60-90-60", "image" : "http://hbz.h-cdn.co/assets/16/33/480x720/hbz-the-list-rope-braids-ciara-gettyimages-533609352.jpg"],
                     ["name": "​Kate Middleton", "body": "60-90-60", "image" : "http://hbz.h-cdn.co/assets/16/22/480x720/hbz-long-hair-kate-middleton.jpg"],
                     
                     ]

    
    var models: NSMutableArray! = []
    
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addBlurEffect()
        self.collectionView.delegate = self
        
        

    }
    
    
    override func viewWillAppear(animated: Bool) {
        makeNavigationBarTranslucent()
        processingDataBefore()
        addBlurEffect()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("CustomCell", forIndexPath: indexPath) as! CustomCell
        
        cell.lbl_name.text = (models.objectAtIndex(indexPath.item) as! Model).name
        
        cell.imagelink = (models.objectAtIndex(indexPath.item) as! Model).linkImage
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    
        
        let detailVC = DetailVC()
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        detailVC.view.backgroundColor = UIColor.whiteColor()
        
        
        let model = models.objectAtIndex(indexPath.item) as! Model
        
        let url = NSURL(string: model.linkImage)
        
        NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            dispatch_async(dispatch_get_main_queue(), { 
                () -> Void in
                
                let image = UIImage(data: data!)
                
                detailVC.imageView.image = image
                
            })
        }.resume()
        
        
        detailVC.nameLabel.text = (models.objectAtIndex(indexPath.item) as! Model).name
        
        
        
    }
    
    
    func processingDataBefore(){
        for item in modelData{
            let model = Model()
            model.name = item["name"]
            model.bodyType = item["body"]
            model.linkImage = item["image"]
            models.addObject(model)
        }
    
    }
    
    

    
    

    func makeNavigationBarTranslucent(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        
//        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
    }

    
    func addBlurEffect(){
        
        var bounds = self.navigationController?.navigationBar.bounds as CGRect!
        
        bounds.offsetInPlace(dx: 0.0, dy: 0.0)
        
        // Add height of status bar
        
        bounds.size.height = bounds.height + 20.0
        
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        
        visualEffectView.frame = bounds
        
        visualEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(white: 0.2, alpha: 1)]
        
        self.view.addSubview(visualEffectView)
        
        self.navigationController?.navigationBar.topItem?.title = "Models"
        
    }

}

