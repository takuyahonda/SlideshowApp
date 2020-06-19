//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 本田卓也 on 2020/06/18.
//  Copyright © 2020 takuya.honda. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
 var selectedImg: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Image Viewに画像を設定
         imageView.image = selectedImg
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
