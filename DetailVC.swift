//
//  DetailVC.swift
//  ClosureApp
//
//  Created by Ngoc on 10/6/16.
//  Copyright © 2016 GDG. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        
//        self.setNeedsStatusBarAppearanceUpdate()
        
        navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
    }
    
    override func viewWillDisappear(animated: Bool) {
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
    }
    
    
//    override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return .LightContent
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .ScaleAspectFill
        imageView.backgroundColor = UIColor.blackColor()
        return imageView
    }()
    
    
    let nameLabel: UILabel = {
    
        let nameLabel = UILabel()
        
        nameLabel.numberOfLines = 2
        
        nameLabel.textColor = UIColor(white: 0.1, alpha: 1)
        
        nameLabel.font = UIFont.boldSystemFontOfSize(24)
        
        return nameLabel
    }()
    
    let bodyLabel: UILabel = {
        
        let label = UILabel()
    
        label.font = UIFont.boldSystemFontOfSize(20)
        
        label.textColor = UIColor.init(red: 244/255, green: 66/255, blue: 188/255, alpha: 1.0)
        
        label.text = "60-90-60"
        
//        label.shadowColor = UIColor.whiteColor()
//        
//        label.shadowOffset = CGSizeMake(0.2, 0.2)
        
        return label
    }()
    
    
    
    
    func addNameLabelToView(){
        
        uiview.addSubview(nameLabel)
        
        uiview.addConstraintsWithFormat("H:|-8-[v0]|", views: nameLabel)
        
        uiview.addConstraintsWithFormat("V:|-2-[v0]|", views: nameLabel)
        
        nameLabel.textAlignment = NSTextAlignment.Center


    
    }
    
    func addBodyTypeToBodyView(){
        
        uiBodyView.addSubview(bodyLabel)
        
        uiBodyView.addConstraintsWithFormat("H:|[v0]|", views: bodyLabel)

        uiBodyView.addConstraintsWithFormat("V:|[v0]|", views: bodyLabel)
        
        bodyLabel.textAlignment = NSTextAlignment.Center
    }
    
    
    let uiview: UIView = {
        let uiview = UIView()
        
        uiview.frame.size = CGSizeMake(30, 30)
    
        var bounds = uiview.bounds as CGRect!
        
        bounds.offsetInPlace(dx: 0.0, dy: 0.0)
        
        // Add height of status bar
        
        bounds.size.height = bounds.height
        
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        
        visualEffectView.frame = bounds
        
        visualEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        
        uiview.addSubview(visualEffectView)
        
        
        return uiview
    }()
    
    
    let uiBodyView: UIView = {
        
        let uiView = UIView()
        
        
        uiView.frame.size = CGSizeMake(30, 30)
        
        var bounds = uiView.bounds as CGRect!
        
        uiView.backgroundColor = UIColor.blackColor()
        
        return uiView
    }()

    

    
    
    
    func addSubviews(){
        view.addSubview(imageView)
        view.addSubview(uiview)
        view.addSubview(uiBodyView)
        
        addNameLabelToView()
        
        addBodyTypeToBodyView()

        view.addConstraintsWithFormat("H:|[v0]|", views: imageView)
        view.addConstraintsWithFormat("V:|[v0]|", views: imageView)
        
        view.addConstraintsWithFormat("H:|-200-[v0]|", views: uiview)
        view.addConstraintsWithFormat("H:|-240-[v0]|", views: uiBodyView)
        
        view.addConstraintsWithFormat("V:|-500-[v0]-10-[v1(30)]-150-|", views: uiview, uiBodyView)

    
    }
}


extension UIView{
    func addConstraintsWithFormat(format: String, views: UIView...){
        var viewsDictionary = [String: UIView]()
        for(index, view) in views.enumerate(){
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
            
        }
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
}

