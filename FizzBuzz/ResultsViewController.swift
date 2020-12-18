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
        view = tableView
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.register(ResultCell.self, forCellReuseIdentifier: "ResultCell")
        return tableView
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
