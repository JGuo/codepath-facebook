//
//  FadeTransition.swift
//  transitionDemo
//
//  Created by Timothy Lee on 11/4/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class FadeTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var photoViewController = toViewController as! PhotoViewController
        
        photoViewController.doneButton.alpha = 0
        photoViewController.photoActions.alpha = 0
        photoViewController.scrollView.backgroundColor = UIColor(white: 0, alpha: 0)
        
        photoViewController.imageView.frame = CGRect(x: 4, y: 193, width: 154, height: 154)
        photoViewController.imageView.contentMode = UIViewContentMode.ScaleAspectFill
        photoViewController.imageView.clipsToBounds = true
        
        UIView.animateWithDuration(duration, animations: {
            photoViewController.doneButton.alpha = 1
            photoViewController.photoActions.alpha = 1
            photoViewController.scrollView.backgroundColor = UIColor(white: 0, alpha: 1)
            
            photoViewController.imageView.frame = CGRect(x: 0, y: 44, width: 320, height: 480)
            
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var photoViewController = fromViewController as! PhotoViewController
        
        photoViewController.doneButton.alpha = 0
        photoViewController.photoActions.alpha = 0
        photoViewController.scrollView.backgroundColor = UIColor(white: 0, alpha: 0)
        
        UIView.animateWithDuration(duration, animations: {
            
            photoViewController.imageView.frame = CGRect(x: 4, y: 193, width: 154, height: 154)
            photoViewController.imageView.contentMode = UIViewContentMode.ScaleAspectFill
            photoViewController.imageView.clipsToBounds = true
            
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
}
