//
//  MenuViewController.swift
//  FInal-Project
//
//  Created by Kevin Infante on 11/17/23.
//

import UIKit
import ParseSwift

class MenuViewController: UIViewController {
    
    
    
   
    
    var isLoggedIn: Bool = false // Set this based on the user's authentication status
    
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
    
    

    

    
    @IBAction func onLogOutTapped(_ sender: Any) {
        showConfirmLogoutAlert()
    }

    private func showConfirmLogoutAlert() {
        let alertController = UIAlertController(title: "Log out of your account?", message: nil, preferredStyle: .alert)
        let logOutAction = UIAlertAction(title: "Log out", style: .destructive) { _ in
            NotificationCenter.default.post(name: Notification.Name("logout"), object: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(logOutAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    
    
    
    
    
    
    

}
