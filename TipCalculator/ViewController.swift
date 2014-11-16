//
//  ViewController.swift
//  TipCalculator
//
//  Created by Yisha Fang on 11/15/14.
//  Copyright (c) 2014 Yisha Fang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLable : UILabel!
    @IBOutlet var resultsTextView : UITextView!

    let tipCal = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTapped(sender : AnyObject){
        // 1
        tipCal.total = Double((totalTextField.text as NSString).doubleValue)
        // 2
        let possibleTips = tipCal.returnPossibleTips()
        var results = ""
        // 3
        for (tipPct, tipValue) in possibleTips {
            // 4
            results += "\(tipPct)%: \(tipValue)\n"
        }
        // 5
        resultsTextView.text = results
    }
    
    @IBAction func taxPercentageChanged(sender : AnyObject){
        tipCal.taxPct = Double(taxPctSlider.value) /  100.0
        refreshUI()
    }
    
    @IBAction func viewTapped(sender : AnyObject){
        totalTextField.resignFirstResponder()
        
    }
    
    func refreshUI(){
        totalTextField.text = String(format : "%0.2f", tipCal.total)
        
        taxPctSlider.value = Float(tipCal.taxPct)*100.0
        
        taxPctLable.text = "Tax Percentage(\(Int(taxPctSlider.value)))%"
        
        resultsTextView.text = ""
    }

}

