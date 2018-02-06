//
//  FirstViewController.swift
//  ikid
//
//  Created by Christy Lu on 2/3/18.
//  Copyright © 2018 Christy Lu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    //@IBOutlet weak var firstTitle: UILabel!
    @IBOutlet weak var firstJoke: UITextView!
    
    fileprivate var firstFlipViewController : FirstFlipViewController!
    
    fileprivate func firstBuilder() {
        if firstFlipViewController == nil {
            firstFlipViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "FirstFlip")
                as! FirstFlipViewController
        }
    }
    
    
    @IBAction func btnNext(_ sender: Any) {
        switchViews()
    }
    
    func switchViews() {
        firstBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if firstJoke.isHidden {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            self.view.frame = view.frame
            switchViewController(firstFlipViewController, to: nil)
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            firstFlipViewController.view.frame = view.frame
            switchViewController(nil, to: firstFlipViewController)
        }
        
        
        UIView.commitAnimations()
    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {

        if to != nil {
            //firstTitle.isHidden = true
            firstJoke.isHidden = true
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        } else {
            firstJoke.isHidden = false
            //firstTitle.isHidden = false
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

