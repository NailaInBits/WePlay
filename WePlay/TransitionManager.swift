//
//  TransitionManager.swift
//  WePlay
//
//  Created by Nishat Anjum on 3/10/17.
//  Copyright © 2017 WePlay. All rights reserved.
//

import UIKit
/*
class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning {
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let container = transitionContext.containerView
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        
        let offScreenRight = CGAffineTransform(translationX: container.frame.width, y: 0)
        let offScreenLeft = CGAffineTransform(translationX: -container.frame.width, y: 0)
        
        toView.transform = offScreenRight
        
        container.addSubview(toView)
        container.addSubview(fromView)
        
        let duration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: [], animations: {
            
            fromView.transform = offScreenLeft
            toView.transform = CGAffineTransform.identity
            
        }, completion: { finished in
            
            transitionContext.completeTransition(true)
            
        })
        
        
    
    }
    
    private var presenting = true
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
 
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }

}*/
