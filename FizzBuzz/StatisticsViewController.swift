//
//  StatisticsViewController.swift
//  FizzBuzz
//
//  Created by Julien Eyriès on 17/12/2020.
//

import UIKit


/*
 - Display a statistics view allowing users to know what the most frequent request has been.
 This view should display a graphical representation of the parameters corresponding to the most complited form,
 as well as the number of hits for this form.
 */

final class StatisticsViewController: UIViewController {
    
    // dependency injection
    let statisticsService: StatisticsServiceProtocol
    
    init(statisticsService: StatisticsServiceProtocol){
        self.statisticsService = statisticsService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        title = "Statistics"
        view = rootView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let (fizzBuzz, hitCount) = statisticsService.mostFrequentRequest() {
            stackView.isHidden = false
            emptyLabel.isHidden = true
            int1Label.text = "int1 = \(fizzBuzz.int1)"
            int2Label.text = "int2 = \(fizzBuzz.int2)"
            limitLabel.text = "limit = \(fizzBuzz.limit)"
            str1Label.text = "str1 = \(fizzBuzz.str1)"
            str2Label.text = "str2 = \(fizzBuzz.str2)"
            hitCountLabel.text = "hitCount = \(hitCount)"
            
        } else {
            stackView.isHidden = true
            emptyLabel.isHidden = false
        }
    }
    
    private lazy var rootView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(stackView)
        view.addSubview(emptyLabel)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emptyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emptyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }()
    
    private lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No request has been made yet."
        label.textAlignment = .center
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = UIStackView.spacingUseSystem
        view.addArrangedSubview(infoLabel)
        view.addArrangedSubview(int1Label)
        view.addArrangedSubview(int2Label)
        view.addArrangedSubview(limitLabel)
        view.addArrangedSubview(str1Label)
        view.addArrangedSubview(str2Label)
        view.addArrangedSubview(hitCountLabel)
        return view
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "The most frequent request has been :"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var int1Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private lazy var int2Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private lazy var limitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private lazy var str1Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    private lazy var str2Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
 
    private lazy var hitCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
}

