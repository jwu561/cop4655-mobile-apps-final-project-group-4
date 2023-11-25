//
//  MenuViewController.swift
//  FInal-Project
//
//  Created by Kevin Infante on 11/17/23.
//

import UIKit

class MenuViewController: UIViewController {
    
    
    
    
    
    @IBOutlet weak var startGameBtn: UIButton!
    
    
    @IBAction func startGameTapped(_ sender: Any) {
        performSegue(withIdentifier: "quizScreen", sender: nil)
    }
    
    @IBAction func toScores(_ sender: Any) {
        performSegue(withIdentifier: "toScores", sender: nil)
    }
    @IBOutlet weak var scoresBtn: UIButton!
    
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
