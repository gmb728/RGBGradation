//
//  ViewController.swift
//  RGBGradiation
//
//  Created by Chang Sophia on 11/10/18.
//  Copyright © 2018 Chang Sophia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var red: UISlider!
    @IBOutlet weak var green: UISlider!
    @IBOutlet weak var blue: UISlider!
    @IBOutlet weak var alpha: UISlider!
    @IBOutlet weak var gradation: UISlider!
    @IBOutlet weak var cornerRadius: UISlider!
    @IBOutlet weak var shadow: UISlider!
    @IBOutlet weak var border: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var gradationLabel: UILabel!
    @IBOutlet weak var cornerRadiusLabel: UILabel!
    @IBOutlet weak var borderLabel: UILabel!
    @IBOutlet weak var shadowLabel: UILabel!    
   
  
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var gradationImageView: UIImageView!
    
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
      
    }
    
    @IBAction func swichAction(_ sender: UISwitch) {
        if redSwitch.isOn {
            red.isEnabled = true
        } else {
            red.isEnabled = false
        }
        if greenSwitch.isOn {
            green.isEnabled = true
        } else {
            red.isEnabled = false
        }
        if blueSwitch.isOn {
            blue.isEnabled = true
        } else {
            blue.isEnabled = false
        }
    }
    
    @IBAction func sliderChange(_ sender: UISlider) {
            bgImageView.backgroundColor = UIColor(
            red: CGFloat(red.value),
            green: CGFloat(green.value),
            blue: CGFloat(blue.value),
            alpha: CGFloat(alpha.value)
        )
        if sender == red {
            redLabel.text = String(format:"%.2f", red.value)
        }else if sender == green {
            greenLabel.text = String(format:"%.2f",green.value)
        }else if sender == blue{
            blueLabel.text = String(format:"%.2f",blue.value)
        }else if sender == alpha {
            alphaLabel.text = String(format:"%.2f",alpha.value)
        }else if sender == gradation{
            gradationLabel.text = String(format:"%.2f",gradation.value)
        }
    }
    
    @IBAction func gradationChange(_ sender: UISlider) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradationImageView.bounds
        gradientLayer.colors = [UIColor.green.cgColor, UIColor.magenta.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.locations = [0, NSNumber(value: gradation.value)]
        gradationImageView.layer.addSublayer(gradientLayer)
        
       
    }
    
    
    @IBAction func cornerRadiusAction(_ sender: Any) {
         bgImageView.clipsToBounds = true
        bgImageView.layer.cornerRadius = CGFloat(cornerRadius.value)
        cornerRadiusLabel.text = String(Int(cornerRadius.value))
        
    }
    @IBAction func borderAction(_ sender: UISlider) {
        self.bgImageView.layer.borderColor = UIColor.black.cgColor
        self.bgImageView.layer.borderWidth = CGFloat(border.value)
        borderLabel.text = String(format:"%.2f",border.value)
        
    }
    
    @IBAction func shadowAction(_ sender: UISlider) {
        bgImageView.layer.masksToBounds = false
        self.bgImageView.layer.shadowOffset = CGSize(width:-5,height:5)
        self.bgImageView.layer.shadowColor = UIColor.darkGray.cgColor
        self.bgImageView.layer.shadowOpacity = 0.8
        self.bgImageView.layer.shadowRadius = CGFloat(shadow.value)
         shadowLabel.text = String(format:"%.2f",shadow.value)
        
    
    }
    
    
    @IBAction func randomAction(_ sender: UIButton) {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        let alpha = Double.random(in: 0...1)
      bgImageView.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
      
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
