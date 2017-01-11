//
//  ViewController.swift
//  TwitterClient
//
//  Created by Seab on 1/11/17.
//  Copyright © 2017 Seab Jackson. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    static let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Twitter Home"
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(StatusCell.self, forCellWithReuseIdentifier: ViewController.cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let statusCell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.cellId, for: indexPath) as! StatusCell
        statusCell.statusTextView.text = "Twitter Status Update \(indexPath.item)"
        return statusCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 80)
    }
    
}

class StatusCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        return textView
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    func setupViews() {
        addSubview(statusTextView)
        addSubview(dividerView)
        
        // constraints for statusTextView
        addConstraintsWithFormat("H:|[v0]|", views: statusTextView)
        addConstraintsWithFormat("V:|[v0]|", views: statusTextView)
        
        // constraints for dividerView
        addConstraintsWithFormat("H:|-8-[v0]|", views: dividerView)
        addConstraintsWithFormat("V:[v0(1)]|", views: dividerView)
    }
}

extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
