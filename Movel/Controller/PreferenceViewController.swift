//
//  PreferenceViewController.swift
//  Movel
//
//  Created by William Inx on 17/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class PreferenceViewController: UIViewController {

    var preference:Preference = Preference(intensity: "Easy",duration: 1)
    let preferenceView = PreferenceView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Preference"
        self.view = preferenceView
        
        loadPreviousData()
        
        preferenceView.durationSlider.addTarget(self, action: #selector(updateDuration(sender:)), for: .valueChanged)
        preferenceView.intensitySegment.addTarget(self, action: #selector(updateIntensity(sender:)), for: .valueChanged)
        preferenceView.saveButton.addTarget(self, action: #selector(savePreference(sender:)), for: .touchDown)
    }
    
    @objc func updateDuration(sender: UISlider!) {
        preferenceView.durationNumber.text = String(Int(round(sender.value)))
        preference.duration = round(sender.value)
        print(preference.duration)
    }
    
    @objc func updateIntensity(sender: UISegmentedControl!) {
        preference.intensity = sender.titleForSegment(at: sender.selectedSegmentIndex)!
        print(preference.intensity)
    }
    
    @objc func savePreference(sender: UIButton!) {
        
        sender.layer.opacity = 0.7
        UIView.animate(withDuration: 0.2) {
            sender.layer.opacity = 1
        }
        let alert = UIAlertController(title: "Saved", message: "Your setting is saved", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
            self.saveData(preference: self.preference)
            self.navigationController?.popToRootViewController(animated: true)
        }))
        
        self.present(alert, animated: true)

    }
    
    func saveData(preference: Preference) {
        let userDefault = UserDefaults.standard
        userDefault.set(preference.duration, forKey: "duration")
        userDefault.set(preference.intensity, forKey: "intensity")
        print("Saved")
    }
    
    func loadPreviousData() {
        let userDefault = UserDefaults.standard
        if (userDefault.float(forKey: "duration") != 0) && (userDefault.string(forKey: "intensity") != nil) {
            preference.duration = userDefault.float(forKey: "duration")
            preference.intensity = userDefault.string(forKey: "intensity")!
            
            preferenceView.durationSlider.value = preference.duration
            preferenceView.durationNumber.text = String(Int(round(preference.duration)))
            preferenceView.intensitySegment.selectedSegmentIndex = getDefaultIntensity(preference: preference)
        }
    }
    
    func getDefaultIntensity(preference:Preference) -> Int {
        switch preference.intensity {
        case "Easy":
            return 0
        case "Medium":
            return 1
        case "Hard":
            return 2
        default:
            return 0
        }
    }
}
