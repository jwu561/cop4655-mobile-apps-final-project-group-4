//
//  ScoresViewController.swift
//  FInal-Project
//
//  Created by Kevin Infante on 11/21/23.
//

import UIKit

class ScoresViewController: UIViewController {

    @IBOutlet weak var menuButton: UIButton!
    
    @IBAction func menuBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "toMenu", sender: nil)
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
