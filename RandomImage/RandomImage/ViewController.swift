//
//  ViewController.swift
//  RandomImage
//
//  Created by Apple on 30/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView();
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton();
        button.backgroundColor = .white
        button.setTitle("Random Image", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemMint
        view.addSubview(imageView)
        imageView.frame = CGRect(x:0, y:0, width: 300, height: 300)
        imageView.center = view.center
        view.addSubview(button)
        getRandomImage()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton(){
        getRandomImage()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 40,
                              y: view.frame.size.height-130-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-80,
                              height: 55)
        
    }
    
    func getRandomImage(){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }


}

