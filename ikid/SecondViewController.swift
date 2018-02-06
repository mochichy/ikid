//
//  SecondViewController.swift
//  ikid
//
//  Created by Christy Lu on 2/3/18.
//  Copyright © 2018 Christy Lu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondJoke: UITextView!
    //@IBOutlet weak var secondTitle: UILabel!
    
    fileprivate var secondFlipViewController : SecondFlipViewController!
    
    fileprivate func secondBuilder() {
        if secondFlipViewController == nil {
            secondFlipViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "SecondFlip")
                as! SecondFlipViewController
        }
    }
    
    @IBAction func btnNext(_ sender: Any) {
        switchViews()
    }
    
    func switchViews() {
        secondBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if secondJoke.isHidden {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            self.view.frame = view.frame
            switchViewController(secondFlipViewController, to: nil)
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            secondFlipViewController.view.frame = view.frame
            switchViewController(nil, to: secondFlipViewController)
        }
        
        
        UIView.commitAnimations()
    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        
        if to != nil {
            //secondTitle.isHidden = true
            secondJoke.isHidden = true
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        } else {
            secondJoke.isHidden = false
            //secondTitle.isHidden = false
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

