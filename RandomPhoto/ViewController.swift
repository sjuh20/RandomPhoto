//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Ana Brito Souza on 03/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let titleLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.text = "Random Photo"
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 35)
        titleLabel.backgroundColor = .systemPink
        titleLabel.textAlignment = .center
        return titleLabel
        
    }()
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        return imageView
        
    }()
    
    private let button: UIButton = {
       let button = UIButton()
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        return button
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        view.addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 0, y: 60, width: view.frame.size.width-40,
                                  height: 100)
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: 300,
                                 height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
   @objc func didTapButton() {
        getRandomPhoto()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30,
            y: view.frame.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height: 55)
    }
    
    func getRandomPhoto() {
        let urlString =
            "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
        
        
    }
}

