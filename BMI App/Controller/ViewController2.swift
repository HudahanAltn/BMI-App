//
//  ViewController2.swift
//  BMI App
//
//  Created by Hüdahan Altun on 12.10.2022.
//

import UIKit

class ViewController2: UIViewController {

    
    @IBOutlet weak var bmıValueLabel: UILabel!
    
    @IBOutlet weak var adviceLabel: UILabel!
    
    
    var clbrain2:CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        if let cl2 = clbrain2{
            
            bmıValueLabel.text = String(format: "%.2f", cl2.getBMIValue())
           
            adviceLabel.text = cl2.getAdvice()
            view.backgroundColor = cl2.getColor()
        }
        
        
        
        
        
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
}
