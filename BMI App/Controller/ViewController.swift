//
//  ViewController.swift
//  BMI App
//
//  Created by Hüdahan Altun on 11.10.2022.
//

import UIKit


extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}


class ViewController: UIViewController {

    //sabit labellar
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var welcomeHeightLabel: UILabel!
    @IBOutlet weak var welcomeWeightLabel: UILabel!
    
    //buton
    @IBOutlet weak var calculateButton: UIButton!
    
    
    //slider
    @IBOutlet weak var heightSL: UISlider!
    
    @IBOutlet weak var weightSL: UISlider!
    
    //slider a bağlı değişecek olan label'lar
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    var calculateBraingOBject = CalculatorBrain()//bmı nesnesi
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //görsel tasarım
        
        welcomeLabel.alpha = 0
        heightSL.alpha = 0
        weightSL.alpha = 0
        welcomeWeightLabel.alpha = 0
        welcomeHeightLabel.alpha = 0
        heightLabel.alpha = 0
        weightLabel.alpha = 0
        calculateButton.alpha = 0
        calculateButton.transform = CGAffineTransform(translationX: 0, y: 5)
        
        
        heightSL.maximumValue = 2.0
        heightSL.minimumValue = 1.0
        heightSL.value = 1.5
        
        heightLabel.text = "\(heightSL.value)m"
        
        heightSL.tintColor = UIColor(rgb:  0xD58BDD)
        heightSL.thumbTintColor = UIColor(rgb: 0x937DC2)
        
        
        weightSL.maximumValue = 150.0
        weightSL.minimumValue = 50.0
        
        weightSL.value = 75.0
        weightLabel.text = "\(weightSL.value)kg"
        weightSL.tintColor = UIColor(rgb:  0xD58BDD)
        weightSL.thumbTintColor = UIColor(rgb: 0x937DC2)
     
        
       //animasyonlu ön yükleme
        UIView.animate(withDuration: 1, animations: {
            
            self.welcomeLabel.transform = CGAffineTransform(translationX: 10, y: 0)
            self.welcomeLabel.alpha = 1
            
        },completion: {
            
            view in
            
            UIView.animate(withDuration: 1, animations: {
                
                self.welcomeHeightLabel.transform = CGAffineTransform(translationX: 10, y: 0)
                self.welcomeWeightLabel.transform = CGAffineTransform(translationX: 10, y: 0)
                self.welcomeHeightLabel.alpha = 1
                self.welcomeWeightLabel.alpha = 1
                self.weightLabel.alpha = 1
                self.heightLabel.alpha = 1
                
                
            },completion: {
                
                view in
                
                UIView.animate(withDuration: 1, animations: {
                    
                    self.heightSL.alpha = 1
                  
                    self.weightSL.alpha = 1
                    
                    self.calculateButton.transform = CGAffineTransform(translationX: 0, y: -5)
                    
                    self.calculateButton.alpha = 1
                })
            })
        })
        
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let bmı_object = sender as? CalculatorBrain{
            
            if segue.identifier == "toVC2"{
                
                let VC2 = segue.destination as? ViewController2
                
                VC2?.clbrain2 = bmı_object
                
            }
            
        }
        
    }
    
    @IBAction func heightSlider(_ sender: UISlider) {
        
//        print("slider:\(heightSL.value)")
        
        let a = String(format:"%.2f",sender.value)
        heightLabel.text = "\(a)m"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        
        let a = String(format:"%.0f",sender.value)
        
        weightLabel.text = "\(a)kg"
    }
    
    
    @IBAction func calculatePressed(_ sender: Any) {
        
        calculateBraingOBject.calculateBMI(height: heightSL.value, Weight: weightSL.value)
        
        self.performSegue(withIdentifier: "toVC2", sender: calculateBraingOBject)
    }
    
}

