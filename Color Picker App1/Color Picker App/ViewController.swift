//
//  ViewController.swift
//  Color Picker App
//
//  Created by Bryant Martinez on 10/20/24.
//

import UIKit

class ViewController: UIViewController{
    
    // Outlets for sliders and box view
    @IBOutlet weak var colorBox: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    // Outlet for UITextFields
    @IBOutlet weak var redValueLabel: UITextField!
    @IBOutlet weak var greenValueLabel: UITextField!
    @IBOutlet weak var blueValueLabel: UITextField!
    
    // Outlet for UISwitches
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initial color of the color box and background
        colorBox.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        updateBackgroundColor()
        
        // Configure sliders' track colors
        configureSlider(slider: redSlider, color: .red)
        configureSlider(slider: greenSlider, color: .green)
        configureSlider(slider: blueSlider, color: .blue)
        
        // Set default switch to off
        redSwitch.isOn = false
        greenSwitch.isOn = false
        blueSwitch.isOn = false
        
    }
    
    // Configure each slider with a specific color
    private func configureSlider(slider: UISlider, color: UIColor) {
        slider.minimumTrackTintColor = color // Use portion of the slider
        slider.maximumTrackTintColor = .black // Unused portion of the slider
        slider.value = 0.5 // Initial value at the center
    }
    
    // Action function to update the color of colorBox and the background color
    @IBAction func sliderChanged(_ sender: UISlider) {
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        
        // Check the switch before changing color
        if !redSwitch.isOn && !greenSwitch.isOn && !blueSwitch.isOn {
            colorBox.backgroundColor = UIColor(
                red: CGFloat(redSlider.value),
                green: CGFloat(greenSlider.value),
                blue: CGFloat(blueSlider.value),
                alpha: 1.0)
            
            
            // Update background color to match sliders' combined color
            updateBackgroundColor()
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) { // Reset the sliders to initial starting value of "0.5"
        
        redSlider.value = 0.5
        greenSlider.value = 0.5
        blueSlider.value = 0.5
        // do the same for the labels
        
        redValueLabel.text = "0.50"
        greenValueLabel.text = "0.50"
        blueValueLabel.text = "0.50"
        
        
        sliderChanged(redSlider)
}

    // Update the background color of the main view
    private func updateBackgroundColor() {
    view.backgroundColor = UIColor(red: CGFloat(redSlider.value),
        green: CGFloat(greenSlider.value),
        blue: CGFloat(blueSlider.value),
        alpha: 1.0
        )
    }
}
