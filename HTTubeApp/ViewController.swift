//
//  ViewController.swift
//  HTTubeApp
//
//  Created by Thạnh Dương Hoàng on 31/1/25.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

