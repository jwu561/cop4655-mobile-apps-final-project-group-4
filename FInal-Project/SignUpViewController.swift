//
//  SignUpViewController.swift
//  FInal-Project
//
//  Created by student on 11/20/23.
//

import UIKit
import SwiftUI

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var emailField: UITextField!
    
    
    @IBOutlet weak var usernameField: UITextField!
    
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Set the background color of the entire view to a different color (if needed)
        self.view.backgroundColor = UIColor.white

        // Create a UIView to represent the light gray background for the top part
        let topGrayView = UIView()
        topGrayView.backgroundColor = UIColor.lightGray

        // Add the top gray background view to your main view
        view.addSubview(topGrayView)

        // Make sure it covers the top part of the parent view
        topGrayView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topGrayView.topAnchor.constraint(equalTo: view.topAnchor),
            topGrayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topGrayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // Set the height of the top gray area, adjust the constant as needed
            topGrayView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.225)
        ])

        // Now, you can add other subviews on top of these background views.
        
        // Now, you can add other subviews (like UIImageView) on top of these background views.
           
           // Example: Add an UIImageView
           let imageView = UIImageView(image: UIImage(named: "globe"))
           imageView.contentMode = .scaleAspectFit
           view.addSubview(imageView)
           imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // Center the imageView horizontally in the gray area
                imageView.centerXAnchor.constraint(equalTo: topGrayView.centerXAnchor),
                // Move the imageView slightly down from the top of the gray area
                imageView.topAnchor.constraint(equalTo: topGrayView.topAnchor, constant: 60),  // Adjust the constant as needed
                // Adjust the width and height of the imageView
                imageView.widthAnchor.constraint(equalToConstant: 130),
                imageView.heightAnchor.constraint(equalToConstant: 130)
           ])
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    @IBAction func onSignupTapped(_ sender: Any) {
    }
    
    
    
    
    
    
    
}
