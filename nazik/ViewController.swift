//
//  ViewController.swift
//  nazik
//
//  Created by Nazik on 13.01.2020.
//  Copyright © 2020 Nazik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var target: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var Totalscore: UILabel!
    
    
    var currentValue: Int = 0
    var targetValue:Int = 0
    var score:Int  = 0
    var round:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        targetValue = Int.random(in: 1...100)
        startNewGame()
    
        let thumbImageNormal  = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thimbImageHighlighed = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thimbImageHighlighed, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let insets2 = UIEdgeInsets(top: 5, left: 14, bottom: 5, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets2)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        
        let trackRightImage = #imageLiteral(resourceName: "SmallButton")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
         
    }



    @IBAction func alert(){
        let difference  = abs(targetValue - currentValue )
        var points = 100 - difference
        let title:String
        if difference == 0 {
            title = "perfect"
            points += 100
        }else if difference < 5 {
            title = "you almost had it"
            if difference == 1{
                points += 50
            }
        }else if difference < 10{
            title = "pretty good"
        }else{
            title = "you don't even close"
        }
        
        score += points
        let massage  = "you scored \(points) points "
        let alert = UIAlertController(title: title , message: massage, preferredStyle: .alert)
        let action  = UIAlertAction(title: "awesome", style: .default, handler: {
            action in self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updatedLabels()
    }
    
    func updatedLabels(){
        target.text = String(targetValue)
        Totalscore.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func startNewGame(){
        round = 0
        score = 0
        startNewRound()
    }
    

}

