//
//  ThirdViewController.swift
//  ikid
//
//  Created by Christy Lu on 2/4/18.
//  Copyright © 2018 Christy Lu. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var thirdJoke: UITextView!
    @IBOutlet weak var thirdTitle: UILabel!
    
    fileprivate var thirdFlipViewController : ThirdFlipViewController!
    
    fileprivate func thirdBuilder() {
        if thirdFlipViewController == nil {
            thirdFlipViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "ThirdFlip")
                as! ThirdFlipViewController
        }
    }
    
    @IBAction func btnNext(_ sender: Any) {
        switchViews()
    }
    func switchViews() {
        thirdBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if thirdJoke.isHidden {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            self.view.frame = view.frame
            switchViewController(thirdFlipViewController, to: nil)
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            thirdFlipViewController.view.frame = view.frame
            switchViewController(nil, to: thirdFlipViewController)
        }
        
        UIView.commitAnimations()
    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        
        if to != nil {
            thirdTitle.isHidden = true
            thirdJoke.isHidden = true
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        } else {
            thirdJoke.isHidden = false
            thirdTitle.isHidden = false
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
