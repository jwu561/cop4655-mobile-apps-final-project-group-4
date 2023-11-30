//
//  ScoresViewController.swift
//  FInal-Project
//
//  Created by Kevin Infante on 11/21/23.
//

import UIKit
import ParseSwift

class ScoresViewController: UIViewController {
    var correctAnswers: Int?
    var wrongAnswers: Int?

    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func menuBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "toMenu", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Access the data
        if let corrects = correctAnswers, let wrongs = wrongAnswers {
            //statement below is provisional, we may use any other way to calculate score
            let score = corrects - wrongs
            scoreLabel.text = "score: \(score)"
            print("Data from first view controller: \(corrects), \(wrongs)")
        } else { print("nothing")}
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
