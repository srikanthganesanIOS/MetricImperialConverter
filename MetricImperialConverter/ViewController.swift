//
//  ViewController.swift
//  MetricImperialConverter
//
//  Project #2: Build a Metric to Imperial Converter
//

import UIKit

class ViewController: UIViewController { // The ViewController for the start screen
    

    @IBOutlet var selections: [UIButton]!
    
    var conversionType : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func selectOption(_ sender: UIButton) {
        
        selections.forEach { selection in
            
            selection.isHidden = selection.isHidden ? false : true
        }
        
    }
    
    //Below two function perform transition from one screen to another using Segue
    
    @IBAction func toConversionScreen(_ sender: UIButton) {
        
        self.conversionType = sender.currentTitle
        
        if (sender.currentTitle == "Weight") {
           performSegue(withIdentifier: "converterSegue", sender: self)
        } else if (sender.currentTitle == "Length") {
           performSegue(withIdentifier: "toLengthSegue", sender: self)
        } else if (sender.currentTitle == "Volume") {
           performSegue(withIdentifier: "toVolumeSegue", sender: self)
        } else {
            performSegue(withIdentifier: "toTemperatureSegue", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "converterSegue" {
            let vc = segue.destination as! ConverterViewController
            vc.conversionType = self.conversionType
        } else if segue.identifier == "toLengthSegue" {
            let vc = segue.destination as! LengthConverterViewController
            vc.conversionType = self.conversionType
        } else if segue.identifier == "toVolumeSegue" {
            let vc = segue.destination as! VolumeConverterViewController
                vc.conversionType = self.conversionType
        } else {
            let vc = segue.destination as! TemperatureConverterViewController
                vc.conversionType = self.conversionType
        }
    
    }
    
    
    @IBAction func unwindToOne(_ sender:UIStoryboardSegue){}
    
  
}

