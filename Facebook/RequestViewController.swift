//
//  RequestViewController.swift
//  Facebook
//
//  Created by Jisi Guo on 2/3/16.
//  Copyright © 2016 Jisi Guo. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var RequestScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RequestScrollView.contentSize = CGSize(width: 320, height: 1000)
        
        RequestScrollView.delegate = self

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
