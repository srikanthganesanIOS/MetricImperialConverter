//
//  ConverterViewController.swift
//  MetricImperialConverter
//
//  Project #2 : Build a Metric to Imperial Converter
//

import UIKit

class ConverterViewController: UIViewController { //ViewController for Weight Conversions
    
    var conversionType : String?
    
    var startingConversionUnit : String?
    
    @IBOutlet var startingUnits: [UIButton]!
    
    @IBOutlet var endingUnits: [UIButton]!
    
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var conversionTypeLabel: UILabel!
    
    @IBOutlet weak var inputUnits: UITextField!
    
    var startUnit : String? = nil
    var endUnit : String? = nil
    
    var inputValue : Double?
    
    @IBOutlet weak var startOverOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startOverOutlet.isHidden = true

        conversionTypeLabel.text = "\(conversionType!) Conversion"
        
    }
    
    @IBAction func selectStartingUnit(_ sender: UIButton) {
        
        for startingUnit in startingUnits {
            if startingUnit.currentTitle == sender.currentTitle {
                startingUnit.isSelected = true
                outputLabel.text = startingUnit.currentTitle
                startUnit = startingUnit.currentTitle
        
            }else{
                startingUnit.isSelected = false
            }
        }
    }
    
    
    @IBAction func selectEndingUnit(_ sender: UIButton) {
        
        for endingUnit in endingUnits {
            if endingUnit.currentTitle == sender.currentTitle {
                endingUnit.isSelected = true
                outputLabel.text = endingUnit.currentTitle
                endUnit = endingUnit.currentTitle
            }else{
                endingUnit.isSelected = false
            }
        }
    }
    
    
    @IBAction func convertUnits(_ sender: UIButton) {
        guard let sunit = startUnit, let eunit = endUnit else {
            print("Inputs not selected") // No alerts built but just printing validation checks for now
            return
            
        }
        
        if(inputUnits.text == ""){
            print("No input value entered") // No alerts built but just printing validation checks for now
            return
        }else{
            inputValue = Double(inputUnits.text!)
        }
        
        startOverOutlet.isHidden = false
        
        if sunit == eunit {
            outputLabel.text = " = \(inputValue!) \(endUnit!)"
        }else if sunit == "Pounds"{
            poundsToOthersConverter() // Calling function to convert from Pounds to Other Units
        }else if sunit == "Ounces"{
            ouncesToOthersConverter() // Calling function to convert from Ounces to Other Units
        }else if sunit == "Stone"{
            stoneToOthersConverter()  // Calling function to convert from Stone to Other Units
        }else if sunit == "Milligrams"{
            milligramToOthersConverter() // Calling function to convert from Milligram to Other Units
        }else if sunit == "Gram"{
            gramToOthersConverter()   // Calling function to convert from Gram to Other Units
        }else if sunit == "Kilogram"{
            kilogramToOthersConverter() // Calling function to convert from Kilogram to Other Units
        }else if sunit == "Tons"{
            tonsToOthersConverter() // Calling function to convert from tons to Other Units
        }
        
    }
    
    // Function converting Pounds to Other Units
    func poundsToOthersConverter(){
        
        let pounds = Measurement(value: inputValue!, unit: UnitMass.pounds)
        
        switch  endUnit {
            case "Ounces":
                let ounces = pounds.converted(to: UnitMass.ounces)
                outputLabel.text = " = \(String(format : "%.3f",ounces.value)) \(ounces.unit.symbol)"
            case "Stone":
                let stone = pounds.converted(to: UnitMass.stones)
                outputLabel.text = " = \(String(format : "%.3f",stone.value)) \(stone.unit.symbol)"
            case "Milligrams":
                let milligrams = pounds.converted(to: UnitMass.milligrams)
                print(milligrams)
                outputLabel.text = " = \(String(format : "%.2f",milligrams.value)) \(milligrams.unit.symbol)"            case "Gram" :
                let grams = pounds.converted(to: UnitMass.grams)
                outputLabel.text = " = \(String(format : "%.3f",grams.value)) \(grams.unit.symbol)"
            case "Kilogram" :
                let kilograms = pounds.converted(to: UnitMass.kilograms)
                outputLabel.text = " = \(String(format : "%.3f",kilograms.value)) \(kilograms.unit.symbol)"
            case "Tons" :
                let tons = pounds.converted(to: UnitMass.shortTons)
                outputLabel.text = " = \(String(format : "%.5f",tons.value)) \(tons.unit.symbol)"
            default:
                print("")
        }
    }
    
    //Function converting Ounces to Other Units
    func ouncesToOthersConverter(){
        
        let ounces = Measurement(value: inputValue!, unit: UnitMass.ounces)
        
        switch  endUnit {
            case "Pounds":
                let pounds = ounces.converted(to: UnitMass.pounds)
                outputLabel.text = " = \(String(format : "%.3f",pounds.value)) \(pounds.unit.symbol)"
            case "Stone":
                let stones = ounces.converted(to: UnitMass.stones)
                outputLabel.text = " = \(String(format : "%.3f",stones.value)) \(stones.unit.symbol)"
            case "Milligrams":
                let milligrams = ounces.converted(to: UnitMass.milligrams)
                outputLabel.text = " = \(String(format : "%.3f",milligrams.value)) \(milligrams.unit.symbol)"
            case "Gram" :
                let grams = ounces.converted(to: UnitMass.grams)
                outputLabel.text = " = \(String(format : "%.3f",grams.value)) \(grams.unit.symbol)"
            case "Kilogram" :
                let kilograms = ounces.converted(to: UnitMass.kilograms)
                outputLabel.text = " = \(String(format : "%.3f",kilograms.value)) \(kilograms.unit.symbol)"
            case "Tons" :
                let tons = ounces.converted(to: UnitMass.shortTons)
                outputLabel.text = " = \(String(format : "%.5f",tons.value)) \(tons.unit.symbol)"
            default:
                print("")
        }
        
    }
    
    //Function converting Stone to Other Units
    func stoneToOthersConverter(){
        
        let stones = Measurement(value: inputValue!, unit: UnitMass.stones)
        
        switch  endUnit {
            case "Ounces":
                let ounces = stones.converted(to: UnitMass.ounces)
                outputLabel.text = " = \(String(format : "%.3f",ounces.value)) \(ounces.unit.symbol)"
            case "Pounds":
                let pounds = stones.converted(to: UnitMass.pounds)
                outputLabel.text = " = \(String(format : "%.3f",pounds.value)) \(pounds.unit.symbol)"
            case "Milligrams":
                let milligrams = stones.converted(to: UnitMass.milligrams)
                outputLabel.text = " = \(String(format : "%.3f",milligrams.value)) \(milligrams.unit.symbol)"
            case "Gram" :
                let grams = stones.converted(to: UnitMass.grams)
                outputLabel.text = " = \(String(format : "%.3f",grams.value)) \(grams.unit.symbol)"
            case "Kilogram" :
                let kilograms = stones.converted(to: UnitMass.kilograms)
                outputLabel.text = " = \(String(format : "%.3f",kilograms.value)) \(kilograms.unit.symbol)"
            case "Tons" :
                let tons = stones.converted(to: UnitMass.shortTons)
                outputLabel.text = " = \(String(format : "%.5f",tons.value)) \(tons.unit.symbol)"
            default:
                print("")
        }
    }
    
    //Function converting Milligram to Other Units
    func milligramToOthersConverter(){
        
        let milligrams = Measurement(value: inputValue!, unit: UnitMass.milligrams)
        
        switch  endUnit {
            case "Ounces":
                let ounces = milligrams.converted(to: UnitMass.ounces)
                outputLabel.text = " = \(String(format : "%.6f",ounces.value)) \(ounces.unit.symbol)"
            case "Stone":
                let stones = milligrams.converted(to: UnitMass.stones)
                outputLabel.text = " = \(String(format : "%.6f",stones.value)) \(stones.unit.symbol)"
            case "Pounds":
                let pounds = milligrams.converted(to: UnitMass.pounds)
                outputLabel.text = " = \(String(format : "%.6f",pounds.value)) \(pounds.unit.symbol)"
            case "Gram" :
                let grams = milligrams.converted(to: UnitMass.grams)
                outputLabel.text = " = \(String(format : "%.6f",grams.value)) \(grams.unit.symbol)"
            case "Kilogram" :
                let kilograms = milligrams.converted(to: UnitMass.kilograms)
                outputLabel.text = " = \(String(format : "%.6f",kilograms.value)) \(kilograms.unit.symbol)"
            case "Tons" :
                let tons = milligrams.converted(to: UnitMass.shortTons)
                outputLabel.text = " = \(String(format : "%.8f",tons.value)) \(tons.unit.symbol)"
            default:
                print("")
        }
        
    }
    
    // Function converting Grams to Other Units
    func gramToOthersConverter(){
        
        let grams = Measurement(value: inputValue!, unit: UnitMass.grams)
        
        switch  endUnit {
            case "Ounces":
                let ounces = grams.converted(to: UnitMass.ounces)
                outputLabel.text = " = \(String(format : "%.3f",ounces.value)) \(ounces.unit.symbol)"
            case "Stone":
                let stones = grams.converted(to: UnitMass.stones)
                outputLabel.text = " = \(String(format : "%.3f",stones.value)) \(stones.unit.symbol)"
            case "Milligrams":
                let milligrams = grams.converted(to: UnitMass.milligrams)
                outputLabel.text = " = \(String(format : "%.3f",milligrams.value)) \(milligrams.unit.symbol)"
            case "Pounds" :
                let pounds = grams.converted(to: UnitMass.pounds)
                outputLabel.text = " = \(String(format : "%.6f",pounds.value)) \(pounds.unit.symbol)"
            case "Kilogram" :
                let kilograms = grams.converted(to: UnitMass.kilograms)
                outputLabel.text = " = \(String(format : "%.3f",kilograms.value)) \(kilograms.unit.symbol)"
            case "Tons" :
                let tons = grams.converted(to: UnitMass.shortTons)
                outputLabel.text = " = \(String(format : "%.5f",tons.value)) \(tons.unit.symbol)"
            default:
                print("")
        }
    }
    
    // Function converting Kilogram to Other Units
    func kilogramToOthersConverter(){
        
        let kilograms = Measurement(value: inputValue!, unit: UnitMass.kilograms)
        
        switch  endUnit {
            case "Ounces":
                let ounces = kilograms.converted(to: UnitMass.ounces)
                outputLabel.text = " = \(String(format : "%.3f",ounces.value)) \(ounces.unit.symbol)"
            case "Stone":
                let stones = kilograms.converted(to: UnitMass.stones)
                outputLabel.text = " = \(String(format : "%.3f",stones.value)) \(stones.unit.symbol)"
            case "Milligrams":
                let milligrams = kilograms.converted(to: UnitMass.milligrams)
                outputLabel.text = " = \(String(format : "%.3f",milligrams.value)) \(milligrams.unit.symbol)"
            case "Gram" :
                let grams = kilograms.converted(to: UnitMass.grams)
                outputLabel.text = " = \(String(format : "%.3f",grams.value)) \(grams.unit.symbol)"
            case "Pounds" :
                let pounds = kilograms.converted(to: UnitMass.pounds)
                outputLabel.text = " = \(String(format : "%.3f",pounds.value)) \(pounds.unit.symbol)"
            case "Tons" :
                let tons = kilograms.converted(to: UnitMass.shortTons)
                outputLabel.text = " = \(String(format : "%.5f",tons.value)) \(tons.unit.symbol)"
            default:
                print("")
        }
    }
    
    // Function converting tons to Other Units
    func tonsToOthersConverter(){
        
        let tons = Measurement(value: inputValue!, unit: UnitMass.shortTons)
        
        switch  endUnit {
            case "Ounces":
                let ounces = tons.converted(to: UnitMass.ounces)
                outputLabel.text = " = \(String(format : "%.3f",ounces.value)) \(ounces.unit.symbol)"
            case "Stone":
                let stones = tons.converted(to: UnitMass.stones)
                outputLabel.text = " = \(String(format : "%.3f",stones.value)) \(stones.unit.symbol)"
            case "Milligrams":
                let milligrams = tons.converted(to: UnitMass.milligrams)
                outputLabel.text = " = \(String(format : "%.3f",milligrams.value)) \(milligrams.unit.symbol)"
            case "Gram" :
                let grams = tons.converted(to: UnitMass.grams)
                outputLabel.text = " = \(String(format : "%.3f",grams.value)) \(grams.unit.symbol)"
            case "Kilogram" :
                let kilograms = tons.converted(to: UnitMass.kilograms)
                outputLabel.text = " = \(String(format : "%.3f",kilograms.value)) \(kilograms.unit.symbol)"
            case "Pounds" :
                let pounds = tons.converted(to: UnitMass.pounds)
                outputLabel.text = " = \(String(format : "%.3f",pounds.value)) \(pounds.unit.symbol)"
            default:
                print("")
        }
    }
    
    
}
