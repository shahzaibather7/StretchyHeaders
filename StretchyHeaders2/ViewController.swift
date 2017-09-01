//
//  ViewController.swift
//  StretchyHeaders2
//
//  Created by Mohammad Shahzaib Ather on 2017-08-31.
//  Copyright © 2017 Mohammad Shahzaib Ather. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource  {


    var navBarExtended = Bool(false)
    var foodArray = [String]()
    
//Outlets
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "SNACKS"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLabel2: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "ADD A SNACK"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var imageView1: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage(named: "oreos")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageV.addGestureRecognizer(tapGesture)
        imageV.isUserInteractionEnabled = true
        return imageV
    }()
    
    lazy var imageView2: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage(named: "pizza_pockets")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageV.addGestureRecognizer(tapGesture)
        imageV.isUserInteractionEnabled = true
        return imageV
    }()
    lazy var imageView3: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage(named: "pop_tarts")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageV.addGestureRecognizer(tapGesture)
        imageV.isUserInteractionEnabled = true
        return imageV
    }()
    lazy var imageView4: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage(named: "popsicle")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageV.addGestureRecognizer(tapGesture)
        imageV.isUserInteractionEnabled = true
        return imageV
    }()
    lazy var imageView5: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage(named: "ramen")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageV.addGestureRecognizer(tapGesture)
        imageV.isUserInteractionEnabled = true
        return imageV
    }()
    
    
    lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [self.imageView1,self.imageView2,self.imageView3,self.imageView3,self.imageView4,self.imageView5])
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    
    
//View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarView.addSubview(stackView)
        navBarView.addSubview(nameLabel)
        navBarView.addSubview(nameLabel2)
        setupStackViewConstraints()
        setupNameLabel()
        setupNameLabel2()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.isHidden = true
        nameLabel2.isHidden = true
        nameLabel.isHidden = false
        
        
        for imageView in stackView.arrangedSubviews
        {
            imageView.contentMode = .scaleAspectFit
        }
        
       
    }

    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let tappedImageView = tapGestureRecognizer.view as! UIImageView
        if tappedImageView == self.imageView1 {
            
            let oreoString = "Oreos"
            foodArray.append(oreoString)
            
        } else if tappedImageView == self.imageView2 {
            
            let pizzaString = "Pizza Pops"
            foodArray.append(pizzaString)
            
        } else if tappedImageView == self.imageView3 {
            
            let popString = "Poptarts"
            foodArray.append(popString)
            
        } else if tappedImageView == self.imageView4 {
            let popsicleString = "Popsicles"
            foodArray.append(popsicleString)
        } else if tappedImageView == self.imageView5 {
            
            let ramenString = "Ramen Noodles"
            foodArray.append(ramenString)
        }
        
        self.tableView.reloadData()
    }

    func setupNameLabel() {
        
        nameLabel2.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor).isActive = true
        nameLabel2.topAnchor.constraint(equalTo: navBarView.topAnchor, constant: 15).isActive = true
        nameLabel2.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nameLabel2.heightAnchor.constraint(equalToConstant: 60).isActive = true
  
    }
    
    func setupNameLabel2() {
        
        nameLabel.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: navBarView.topAnchor, constant: 15).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    
    func setupStackViewConstraints() {
        stackView.leftAnchor.constraint(equalTo: navBarView.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: navBarView.rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: navBarView.bottomAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = foodArray[indexPath.row]
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodArray.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
//Navigation Bar Button
    
    @IBAction func extendButton(_ sender: Any) {
        if navBarExtended == false {
            stackView.isHidden = false
            nameLabel2.isHidden = false
            nameLabel.isHidden = true
            UIView.animate(withDuration: 2.0 , delay: 0.0, usingSpringWithDamping: 0.3 , initialSpringVelocity: 3.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.heightConstraint.constant = 200
                self.view.layoutIfNeeded()
                }, completion: nil)
            UIView.animate(withDuration: 1, animations: {
                self.button.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
                self.view.layoutIfNeeded()
            })
           
            } else if navBarExtended == true {
            stackView.isHidden = true
            nameLabel2.isHidden = true
            nameLabel.isHidden = false
            UIView.animate(withDuration: 2.0 , delay: 0.0, usingSpringWithDamping: 0.3 , initialSpringVelocity: 3.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.heightConstraint.constant = 66
                self.view.layoutIfNeeded()
            }, completion: nil)
            UIView.animate(withDuration: 1, animations: {
                self.button.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
                self.view.layoutIfNeeded()
            })
        }
        navBarExtended = !navBarExtended
    }
 

    
    
    
    
    
}

