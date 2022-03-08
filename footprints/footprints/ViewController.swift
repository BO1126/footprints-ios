//
//  ViewController.swift
//  footprints
//
//  Created by 이정우 on 2022/03/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tapGesture : UITapGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapViewGesture(){
        let newImageView = UIImageView()
        newImageView.frame = CGRect(x: (tapGesture.location(in: self.view).x-40), y: (tapGesture.location(in: self.view).y-40), width: 80, height: 80)
        newImageView.image = UIImage(named: "footprint")
        self.view.addSubview(newImageView)
        let time = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: time) {
            UIView.animate(withDuration: 0.5, animations: {
                newImageView.alpha = 0
            })
        }
    }


}

