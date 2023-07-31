//
//  ViewController.swift
//  RandomImage
//
//  Created by UMAR FAROOK M on 30/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    // CREATE THE IMAGE VIEW AND ITS STYLES
    private let imageView: UIImageView = {
        let imageView = UIImageView();
        //STYLES
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    // CREATE THE BUTTON AND ITS STYLES
    private let button: UIButton = {
        let button = UIButton();
        //STYLES AND BUTTON LABEL
        button.backgroundColor = .white
        button.setTitle("Random Image", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // SET BACKGROUND COLOR FOR THE HOME SCREEN
        view.backgroundColor = .systemMint
        // ADDED IMAGE VIEW IN MAIN MAIN VIEW
        view.addSubview(imageView)
        imageView.frame = CGRect(x:0, y:0, width: 300, height: 300)
        imageView.center = view.center
        // ADDED BUTTON IN MAIN MAIN VIEW
        view.addSubview(button)
        // ATTACHED THE TOUCH LISTENER TO THE BUTTON
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        // CALL THE IMAGE API FOR FIRST TIME
        getRandomImage()
        
    }
    
    // LISTENER METHOD
    @objc func didTapButton(){
        getRandomImage()
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // SET THE BUTTON POSITION
        button.frame = CGRect(x: 40,
                              y: view.frame.size.height-130-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-80,
                              height: 55)
        
    }
    
    // DO THE API CALL AND SET THE IMAGE DATA INTO IMAGE VIEW
    func getRandomImage(){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }


}

