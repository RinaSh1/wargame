//
//  ViewController.swift
//  wargame
//
//  Created by Rina Shabani on 8.6.22.
//

import UIKit

class ViewController: UIViewController {
    let card1ImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "card1.png"))
        
        imageView.translatesAutoresizingMaskIntoConstraints=false
        return imageView
    }()
    let card2ImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "card2.png"))
        
        imageView.translatesAutoresizingMaskIntoConstraints=false
        return imageView
    }()
    let button = UIButton()
    
    let playerLabel = UILabel(frame: CGRect(x: 150, y: 0, width: 700, height: 21))
    var playerScore:Int = 0
    let enemyLabel = UILabel(frame: CGRect(x: 45, y: 0, width: 700, height: 21))
    var enemyScore:Int = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGreen
        //Button
        button.setTitle("Play", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(playRoundTapped), for: .touchUpInside)
        //this enable our button view
        view.addSubview(button)
        
        view.addSubview(card1ImageView)
        view.addSubview(card2ImageView)
        view.addSubview(playerLabel)
        view.addSubview(enemyLabel)
        
        setupLayout()
        
        
        
    }
    private func setupLayout() {
        
        card1ImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive=true
        card1ImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        
        card2ImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 280).isActive = true
        card2ImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        // button.backgroundColor = UIColor.systemPink
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 200).isActive=true
        button.widthAnchor.constraint(equalToConstant: 200).isActive=true
        button.heightAnchor.constraint(equalToConstant: 40).isActive=true
        
        //Label
        playerLabel.translatesAutoresizingMaskIntoConstraints = false
        playerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -130).isActive=true
        playerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 90).isActive=true
        playerLabel.text = "0"
        
        enemyLabel.translatesAutoresizingMaskIntoConstraints = false
        enemyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 130).isActive=true
        enemyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 90).isActive=true
        enemyLabel.text = "0"
        
        
        
    }
    
    
    @objc  func playRoundTapped(Sender: UIButton)
    {
        //button.setTitle("Play Round", for: UIControl.State.normal)
        // Randomize a number for the first imageview
        let firstRandomNumber = arc4random_uniform(13) + 1
        
        //construct a string with a random number,( this string is an object of string class that combine a variable in a string)
        var firsrCardString:String = String(format: "card%i", firstRandomNumber)
        
        //Set the first card image view to the asset corresponding to the randomize number
        self.card1ImageView.image = UIImage(named: firsrCardString)
        
        let secondRandomNumber = arc4random_uniform(13) + 1
        
        //construct a string with a random number
        var secondCardString:String = String(format: "card%i", secondRandomNumber)
        
        self.card2ImageView.image = UIImage(named: secondCardString)
        
        
        //Determine the higher card
        if firstRandomNumber > secondRandomNumber {
            
            // first card is larger
            self.playerScore += 1
            
            self.playerLabel.text = String(playerScore)
        }
        else if firstRandomNumber == secondRandomNumber {
            //number are equal
        }
        else{
            //second number is equal
            self.enemyLabel.text = String(enemyScore)
            self.enemyScore += 1
        }
        
    }
}


