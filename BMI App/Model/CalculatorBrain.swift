//
//  CalculatorBrain.swift
//  BMI App
//
//  Created by Hüdahan Altun on 12.10.2022.
//

import Foundation
import UIKit


class CalculatorBrain{//bmı verisin tutulması için struct
    
    private var bmi:BMI = BMI() //bmı değeri tutulacak
    
    
    init(){//boş init
        
    }
    
    
    func calculateBMI(height:Float,Weight:Float){//bmı değerini hesaplayan fonksiyon
        
        let bmiValue = Weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor(rgb: 0xFF99D7))
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor(rgb:  0x2192FF))
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: .red)
        }

        
    }

    func getBMIValue()->Float{//bmı değerini döndüren fonksiyon
        
        return bmi.getValue()!
    }
    
    func getAdvice()->String{
        
        return bmi.getAdvice()!
        
    }
    
    func getColor()->UIColor{
        
        return bmi.getColor()!
        
    }
  
}
