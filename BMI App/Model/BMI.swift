//
//  BMI.swift
//  BMI App
//
//  Created by Hüdahan Altun on 12.10.2022.
//

import Foundation
import UIKit

class BMI{
    
    private var value:Float?
    private var color:UIColor?
    private var advice:String?
    
    init(){
        
        
    }
    
    
    init(value:Float,advice:String,color:UIColor){
        
        self.value = value
        self.color = color
        self.advice = advice
    }
    
    
    func getColor()->UIColor?{
        
        return color!
    }
    func getAdvice()->String?{
        
        return advice!
    }
    func getValue()->Float?{
        
        return value!
    }
}
