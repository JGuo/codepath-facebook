//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Jisi Guo on 3/5/16.
//  Copyright © 2016 Jisi Guo. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var photoActions: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    var image: UIImage!
    var dismiss: Bool!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismiss = false
        imageView.image = image
        
        scrollView.contentSize = CGSize(width: 320, height: 569)
        scrollView.delegate = self // register for the scroll
    
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneTap(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
        print("scroll started")
        print(scrollView.contentOffset.y)
        
        var scrollAlpha: CGFloat!
        if (dismiss == false) {
            scrollAlpha = convertValue(scrollView.contentOffset.y, r1Min:0 , r1Max: -100, r2Min: 1, r2Max: 0)
            
            scrollView.backgroundColor = UIColor(white: 0, alpha: scrollAlpha)
            doneButton.alpha = scrollAlpha
            photoActions.alpha = scrollAlpha
        }
        
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            if scrollView.contentOffset.y < -100 {
                dismiss = true
                dismissViewControllerAnimated(true, completion: nil)
            } else {
                doneButton.alpha = 1
                photoActions.alpha = 1
            }
            print("scroll DONE")
            print(scrollView.contentOffset.y)
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
