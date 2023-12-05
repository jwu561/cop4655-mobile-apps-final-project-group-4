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

    
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    @IBOutlet weak var logOutBtn: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func menuBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "toMenu", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkUserAuthentication()

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
    
    
    func checkUserAuthentication() {
        if let currentUser = (User.current ) {
            // The user is logged in
            let username = currentUser.username ?? "Unknown User"
            print("User is logged in as \(username)")
            
            // Assuming you have a UILabel named usernameLabel
            usernameLabel.text = "\(username)"
            usernameLabel.isHidden = false
            logOutBtn.isHidden = false

            
        } else {
            // The user is not logged in
            print("User is not logged in")
            usernameLabel.isHidden = true
            logOutBtn.isHidden = true
        }
    }
    
    
    
}
