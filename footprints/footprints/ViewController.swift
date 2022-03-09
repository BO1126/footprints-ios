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
        let num = 0
        let bool = true
        let tapX = tapGesture.location(in: self.view).x-25
        let tapy = tapGesture.location(in: self.view).y-25
        printFootprints(num: num,tapX: tapX,tapY: tapy, bool: bool)
    }
    
    func printFootprints(num : Int, tapX : CGFloat, tapY : CGFloat, bool : Bool){
        var number = num
        var x = tapX
        var y = tapY
        var b = bool
        let newImageView = UIImageView()
        newImageView.frame = CGRect(x: x, y: y, width: 50, height: 50)
        newImageView.image = UIImage(named: "footprint")
        self.view.addSubview(newImageView)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(1200)) {
            UIView.animate(withDuration: 0.4, animations: {
                newImageView.alpha = 0
            })
        }
        if b == true{
            x -= 70
            b = false
        }else{
            x += 70
            b = true
        }
        if number < 10{
            number+=1
            y -= 80
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(200)) {
                self.printFootprints(num: number,tapX: x,tapY: y,bool: b)
            }
        }
    }
}
