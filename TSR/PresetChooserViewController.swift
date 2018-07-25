//
//  PresetChooserViewController.swift
//  TSR
//
//  Created by Jun Kyu on 2018. 7. 21..
//  Copyright © 2018년 JJworks. All rights reserved.
//

import UIKit

class PresetChooserViewController: UIViewController {

    let presetGameTimes = ["Preset 1": 420, "Preset 2": 600, "Preset 3": 1800, "Preset 4": 2700]
    
    let presetHalfTimes = ["Preset 1": 60, "Preset 2": 120, "Preset 3": 600, "Preset 4": 900]


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Preset" {
            if let presetGameName = (sender as? UIButton)?.currentTitle, let presetGameTime = presetGameTimes[presetGameName], let presetHalfTime = presetHalfTimes[presetGameName]{
                if let tvc = segue.destination as? TimerScoreViewController {
                    tvc.gameTime = presetGameTime
                    tvc.halfTime = presetHalfTime
                }
            }
            
        }
        
    }
    
}
