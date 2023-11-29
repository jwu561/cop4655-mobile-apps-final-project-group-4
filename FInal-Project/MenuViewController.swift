//
//  MenuViewController.swift
//  FInal-Project
//
//  Created by Kevin Infante on 11/17/23.
//

import UIKit

class MenuViewController: UIViewController {
    
    var hardMode = false
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "quizScreen" {
            if let senderButton = sender as? UIButton {
                if senderButton == startGameBtn {
                    // The segue was triggered by the startGameBtn
                    hardMode = false
                } else if senderButton == hardModebtn {
                    // The segue was triggered by the hardModeBtn
                    hardMode = true
                }
                
                // Set the hardMode property in the destination view controller
                if let quizView = segue.destination as? ViewController {
                    quizView.hardMode = hardMode
                }
            }
        }
    }
    
    @IBOutlet weak var startGameBtn: UIButton!
    @IBOutlet weak var hardModebtn: UIButton!
    @IBOutlet weak var scoresBtn: UIButton!
    
    @IBAction func startGameTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "quizScreen", sender: sender)
    }
    
    @IBAction func hardModeTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "quizScreen", sender: sender)
    }
    
    @IBAction func toScores(_ sender: Any) {
        performSegue(withIdentifier: "toScores", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
