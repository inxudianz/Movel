//
//  PreferenceView.swift
//  Movel
//
//  Created by William Inx on 17/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class PreferenceView: MasterView {
    
    let intensityLabel = UILabel()
    let intensitySegment = UISegmentedControl()
    let durationLabel = UILabel()
    let durationSlider = UISlider()
    let durationNumber = UILabel()
    let saveButton = UIButton()
    
    override func setupView() {
        backgroundColor = .white
        
        initIntensityLabel()
        initIntensitySegment()
        initDurationLabel()
        initDurationSlider()
        initDurationNumber()
        initSaveButton()
        
        addToView()
    }
    
    func addToView() {
        self.addSubview(intensityLabel)
        self.addSubview(intensitySegment)
        self.addSubview(durationLabel)
        self.addSubview(durationSlider)
        self.addSubview(durationNumber)
        self.addSubview(saveButton)
    }
    
    func initIntensityLabel() {
        intensityLabel.frame = CGRect(x: 176, y: 123, width: 70, height: 19)
        intensityLabel.text = "Intensity"
        intensityLabel.font = intensityLabel.font.withSize(16)
        intensityLabel.textColor = textColor
    }
    
    func initIntensitySegment() {
        intensitySegment.frame = CGRect(x: 36, y: 157, width: 343, height: 27)
        intensitySegment.insertSegment(withTitle: "Easy", at: 0, animated: true)
        intensitySegment.insertSegment(withTitle: "Medium", at: 1, animated: true)
        intensitySegment.insertSegment(withTitle: "Hard", at: 2, animated: true)
        intensitySegment.selectedSegmentIndex = 0
    }
    
    func initDurationLabel() {
        durationLabel.frame = CGRect(x: 176, y: 219, width: 70, height: 19)
        durationLabel.text = "Duration"
        durationLabel.font = durationLabel.font.withSize(16)
        durationLabel.textColor = textColor
    }
    
    func initDurationSlider() {
        durationSlider.frame = CGRect(x: 64, y: 273, width: 287, height: 44)
        durationSlider.maximumValue = 60
        durationSlider.value = 30
        durationSlider.minimumValue = 10
        durationSlider.isEnabled = true
    }
    
    func initDurationNumber() {
        durationNumber.frame = CGRect(x: 197, y: 317, width: 40, height: 20)
        durationNumber.text = "30"
        durationNumber.font = durationNumber.font.withSize(16)
        durationNumber.textColor = textColor
    }
    
    func initSaveButton() {
        saveButton.frame = CGRect(x: 107, y: 387, width: 200, height: 50)
        saveButton.layer.cornerRadius = 8
        saveButton.layer.backgroundColor = buttonColor?.cgColor
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.isEnabled = true
    }
}
