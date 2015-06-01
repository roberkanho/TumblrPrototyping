//
//  ComposeViewController.swift
//  TumblrPrototyping
//
//  Created by Nan Chen on 5/31/15.
//  Copyright (c) 2015 Nan Chen. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var textIcon: UIImageView!
    @IBOutlet weak var photoIcon: UIImageView!
    @IBOutlet weak var quoteIcon: UIImageView!
    @IBOutlet weak var linkIcon: UIImageView!
    @IBOutlet weak var chatIcon: UIImageView!
    @IBOutlet weak var videoIcon: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textIcon.alpha = 0
        photoIcon.alpha = 0
        quoteIcon.alpha = 0
        linkIcon.alpha = 0
        chatIcon.alpha = 0
        videoIcon.alpha = 0
        
        textIcon.center.y = 500
        photoIcon.center.y = 300
        quoteIcon.center.y = 450
        linkIcon.center.y = 800
        chatIcon.center.y = 400
        videoIcon.center.y = 900
        
    }

    override func viewDidAppear(animated: Bool) {
    
    
        UIView.animateWithDuration(0.4, animations: {
            self.textIcon.frame.origin.y = 149
            self.textIcon.alpha = 1
        })
        
        UIView.animateWithDuration(0.4, animations: {
            self.photoIcon.frame.origin.y = 149
            self.photoIcon.alpha = 1
        })

        UIView.animateWithDuration(0.4, animations: {
            self.quoteIcon.frame.origin.y = 149
            self.quoteIcon.alpha = 1
        })
        UIView.animateWithDuration(0.5, animations: {
            self.linkIcon.frame.origin.y = 266
            self.linkIcon.alpha = 1
        })
        
        UIView.animateWithDuration(0.4, animations: {
            self.chatIcon.frame.origin.y = 266
            self.chatIcon.alpha = 1
        })
        
        UIView.animateWithDuration(0.5, animations: {
            self.videoIcon.frame.origin.y = 266
            self.videoIcon.alpha = 1
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTapNeverMind(sender: UITapGestureRecognizer) {
        UIView.animateWithDuration(0.4, animations: {
            self.textIcon.frame.origin.y = -200
            self.textIcon.alpha = 0
        })
        
        UIView.animateWithDuration(0.4, animations: {
            self.photoIcon.frame.origin.y = -100
            self.photoIcon.alpha = 0
        })
        
        UIView.animateWithDuration(0.4, animations: {
            self.quoteIcon.frame.origin.y = -150
            self.quoteIcon.alpha = 0
        })
        UIView.animateWithDuration(0.5, animations: {
            self.linkIcon.frame.origin.y = -200
            self.linkIcon.alpha = 0
        })
        
        UIView.animateWithDuration(0.4, animations: {
            self.chatIcon.frame.origin.y = -150
            self.chatIcon.alpha = 0
        })
        
        UIView.animateWithDuration(0.5, animations: {
            self.videoIcon.frame.origin.y = -100
            self.videoIcon.alpha = 0
        })
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
