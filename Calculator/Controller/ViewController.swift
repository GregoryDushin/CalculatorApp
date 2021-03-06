//
//  ViewController.swift
//  Calculator
//
//  Created by Григорий Душин on 16.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumber : Bool = true
    
    private var displayValue: Double {
        get{
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to Double.")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
            
        }
        
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
                
            } else{
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt  {
                        return
                    }
                    
                    
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
        
        
    }
}
