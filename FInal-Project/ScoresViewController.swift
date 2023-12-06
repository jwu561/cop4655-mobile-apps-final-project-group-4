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
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var logOutBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Check if the user is logged in
        if var currentUser = User.current {
            // User is logged in
            let userScore = currentUser.score ?? 0
            let correctScore = correctAnswers ?? 0
            let wrongScore = wrongAnswers ?? 0
            let score = correctScore - wrongScore
            usernameLabel.isHidden = false
            logOutBtn.isHidden = false

            // Update the user's score property
            currentUser.score = score
            currentUser.save { result in
                switch result {
                case .success:
                    print("User's score updated successfully.")

                    // Now you can use the updated `currentUser` as needed.

                    // Update the score label on the main thread
                    DispatchQueue.main.async {
                        self.scoreLabel.text = "User Score: \(currentUser.score ?? 0)"
                    }

                    // Safely unwrap the username using optional binding
                    if let username = currentUser.username {
                        // Update the user label on the main thread
                        DispatchQueue.main.async {
                            self.userLabel.text = "User: \(username)"
                        }
                    } else {
                        // Update the user label on the main thread
                        DispatchQueue.main.async {
                            self.userLabel.text = "User: Unknown User"
                        }
                    }
                case .failure(let error):
                    print("Error updating user's score: \(error)")
                }
            }
        } else {
            // User is not logged in
            if let corrects = correctAnswers, let wrongs = wrongAnswers {
                let score = corrects - wrongs
                scoreLabel.text = "Score: \(score)"
                print("Data from first view controller: \(corrects), \(wrongs)")
            } else {
                scoreLabel.text = "Score: 0"
            }

            // Update the user label for guests
            userLabel.text = "Guest"
            usernameLabel.isHidden = true
            logOutBtn.isHidden = true
        }
    }
    


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
