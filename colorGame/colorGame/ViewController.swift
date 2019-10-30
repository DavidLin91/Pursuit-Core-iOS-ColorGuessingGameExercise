//
//  ViewController.swift
//  colorGame
//
//  Created by David Lin on 10/29/19.
//  Copyright © 2019 David Lin. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var colorBox: UIView!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var highScoreBox: UILabel!
    @IBOutlet weak var yourScoreBox: UILabel!
    @IBOutlet weak var rightWrongLabel: UILabel!
    
    
    var yourScore = 1
    let highScore = 0
    var counter = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNewColor()
        yourScoreBox.text = "0"
        highScoreBox.text =  
    }
     
    func randomNewColor () {
        let randNumRed = CGFloat.random(in: 0...1)
        let randNumGreen = CGFloat.random(in: 0...1)
        let randNumBlue = CGFloat.random(in: 0...1)
        let randNumAlpha = CGFloat.random(in: 0...1)
        let myColor = UIColor(red: randNumRed, green: randNumGreen, blue: randNumBlue, alpha: randNumAlpha)
        colorBox.backgroundColor = myColor

        let numRedInt:Float = Float(randNumRed)
        let numGreenInt:Float = Float(randNumGreen)
        let numBlueInt: Float = Float(randNumBlue)
    
        if numRedInt > numGreenInt && numRedInt > numBlueInt {
            counter = 0
        } else if numGreenInt > numRedInt && numGreenInt > numBlueInt {
            counter = 1
        } else if numBlueInt > numRedInt && numBlueInt > numGreenInt {
            counter = 2
        } else if numRedInt == numGreenInt && numRedInt == numBlueInt && numBlueInt == numGreenInt {
            randomNewColor()
        }
    }
    
    @IBAction func colorButtons(_ sender: UIButton) {
        
        let yourScoreString = String(yourScore)
        if sender.tag == counter {
            yourScore += 1
            yourScoreBox.text = yourScoreString
            rightWrongLabel.text = "🎉 CORRECT 🎉"
            randomNewColor()
            
        } else if sender.tag != counter {
            redButton.isEnabled = false
            greenButton.isEnabled = false
           blueButton.isEnabled = false
            rightWrongLabel.text = " 💀 GAME OVER 💀"
            var highScoreString = String(highScore)
            print(highScore)
      if yourScore > highScore {
          highScoreBox.text = yourScoreBox.text
          print("here")
      }

        }
        
        // CANNOT GET HIGH SCORE TO PRINT
        
       
}
    
    
    
    
    @IBAction func playAgain(_ sender: UIButton) {
            yourScore = 1
            //yourScoreBox.text = "0"
            rightWrongLabel.text = " "
//            viewDidLoad()
            redButton.isEnabled = true
            greenButton.isEnabled = true
            blueButton.isEnabled = true
        randomNewColor()
         yourScoreBox.text = "0"
        if yourScore > highScore {
                  highScoreBox.text = yourScoreBox.text
                  print("here")
              }
    }


}
