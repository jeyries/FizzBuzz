//
//  ResultsViewController.swift
//  FizzBuzz
//
//  Created by Julien Eyriès on 17/12/2020.
//

import UIKit


/*

 - Display a list of strings with numbers from 1 to limit, where: all multiples of int1 are replaced by str1, all multiples of int2 are replaced by str2, all multiples of int1 and int2 are replaced by str1str2.
 */

final class ResultsViewController: UIViewController {

    let fizzBuzz: FizzBuzz
    
    init(fizzBuzz: FizzBuzz){
        self.fizzBuzz = fizzBuzz
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        title = "Results"
        view = collectionView
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.register(ResultCell.self, forCellReuseIdentifier: "ResultCell")
        return tableView
    }()
    
    private lazy var layout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 50, height: 50)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.dataSource = self;
        collectionView.backgroundColor = .white
        collectionView.register(ResultCollectionCell.self, forCellWithReuseIdentifier: "ResultCollectionCell")
        return collectionView
    }()
    
}


extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fizzBuzz.limit
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as! ResultCell
        let text = fizzBuzz.compute(at: 1+indexPath.row)
        cell.configure(text: text)
        return cell
    }
    
}


private class ResultCell: UITableViewCell {
    
    func configure(text: String) {
        self.textLabel?.text = text
    }
    
}

///

extension ResultsViewController: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fizzBuzz.limit
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCollectionCell", for: indexPath as IndexPath) as! ResultCollectionCell
        let text = fizzBuzz.compute(at: 1+indexPath.row)
        cell.configure(text: text)
        return cell
    }
}

private class ResultCollectionCell: UICollectionViewCell {
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = .green
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(infoLabel)
        infoLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        infoLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        infoLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String) {
        self.infoLabel.text = text
    }
    
}


