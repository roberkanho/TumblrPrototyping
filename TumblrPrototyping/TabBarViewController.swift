//
//  TabBarViewController.swift
//  TumblrPrototyping
//
//  Created by Nan Chen on 5/31/15.
//  Copyright (c) 2015 Nan Chen. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate,  UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true

    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    
    var homeViewController: HomeViewController!
    var searchViewController: SearchViewController!
    var accountViewController: AccountViewController!
    var trendingViewController: TrendingViewController!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabbarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stateChange("home")
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as! SearchViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as! AccountViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as! TrendingViewController

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onTapHomeButton(sender: AnyObject) {
        contentView.addSubview(homeViewController.view)
        stateChange("home")
    }
    
    @IBAction func onTapSearchButton(sender: AnyObject) {
        contentView.addSubview(searchViewController.view)
        stateChange("search")

    }
    
    @IBAction func onTapAccountButton(sender: AnyObject) {
        contentView.addSubview(accountViewController.view)
        stateChange("account")

    }
    
    @IBAction func onTapTrendingButton(sender: AnyObject) {
        contentView.addSubview(trendingViewController.view)
        stateChange("trending")

    }
    
    
    func displayContentController(content: UIViewController) {
        addChildViewController(content)
        contentView.addSubview(content.view)
        content.didMoveToParentViewController(self)
        println("\(contentView.subviews.count)")
    }
    
    
    
    func stateChange(state: String){
        if state == "home" {
                        
            homeButton.selected = true
            searchButton.selected = false
            composeButton.selected = false
            accountButton.selected = false
            trendingButton.selected = false
        
        }
        if state == "search" {
            
            homeButton.selected = false
            searchButton.selected = true
            composeButton.selected = false
            accountButton.selected = false
            trendingButton.selected = false
            
        }
        if state == "account" {
            
            homeButton.selected = false
            searchButton.selected = false
            composeButton.selected = false
            accountButton.selected = true
            trendingButton.selected = false
            
        }
        if state == "trending" {
            
            homeButton.selected = false
            searchButton.selected = false
            composeButton.selected = false
            accountButton.selected = false
            trendingButton.selected = true
            
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as! UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }       

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
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
