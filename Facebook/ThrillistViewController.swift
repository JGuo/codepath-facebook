//
//  ThrillistViewController.swift
//  Facebook
//
//  Created by Jisi Guo on 2/3/16.
//  Copyright © 2016 Jisi Guo. All rights reserved.
//

import UIKit

class ThrillistViewController: UIViewController,UIScrollViewDelegate {

    @IBAction func likeButton(sender: UIButton) {
        sender.selected = true
    }

    @IBOutlet weak var ThrillistScrollView: UIScrollView!
    
    @IBOutlet weak var thrillistImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ThrillistScrollView.delegate = self
        ThrillistScrollView.contentSize = thrillistImage.image!.size

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
