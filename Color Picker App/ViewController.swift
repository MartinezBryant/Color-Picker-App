//
//  ViewController.swift
//  Color Picker App
//
//  Created by Bryant Martinez on 10/20/24.
//

import UIKit

class ViewController: UIViewController {

    // Outlets for sliders and box view
    @IBOutlet weak var colorBox: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initial color of the color box and background
        colorBox.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        updateBackgroundColor()
        
        // Configure sliders' track colors
        configureSlider(slider: redSlider, color: .red)
        configureSlider(slider: greenSlider, color: .green)
        configureSlider(slider: blueSlider, color: .blue)
    }

    // Configure each slider with a specific color
    private func configureSlider(slider: UISlider, color: UIColor) {
        slider.minimumTrackTintColor = color     // Used portion of the slider
        slider.maximumTrackTintColor = .black    // Unused portion of the slider
        slider.value = 0.5                       // Initial value at the center
    }
    
    // Action function to update the color of colorBox and the background color
    @IBAction func sliderChanged(_ sender: UISlider) {
        colorBox.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0
        )
        
        // Update background color to match sliders' combined color
        updateBackgroundColor()
    }
    
    // Update the background color of the main view
    private func updateBackgroundColor() {
        view.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0
        )
    }
}
