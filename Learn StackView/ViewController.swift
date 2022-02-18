//
//  ViewController.swift
//  Learn StackView
//
//  Created by Steven Hertz on 4/16/19.
//  Copyright © 2019 DevelopItSolutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var stackView: UIStackView = {
        let stkV = UIStackView()
        stkV.axis = .vertical
        stkV.spacing = 10.0
        stkV.distribution = .equalSpacing
        stkV.translatesAutoresizingMaskIntoConstraints = false
        return stkV
    }()
    

    //  MARK: -  private functions
    fileprivate func layOutStackView() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate(
            [
                // stackView.widthAnchor.constraint(equalToConstant: 300),
                // stackView.heightAnchor.constraint(equalToConstant: 400),
                stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ] )
    }
    
    
    fileprivate func makeConfig(withtitle title: String) -> UIButton.Configuration {
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.cornerStyle = .medium
        buttonConfig.title = title
        return buttonConfig
    }
    
    
    func makeButton(withtitle title: String, doing actionhndl: @escaping UIActionHandler) -> UIButton {
        return UIButton(configuration: makeConfig(withtitle: title), primaryAction: UIAction(handler: actionhndl))
    }
    
    

    //  MARK: -  lifecycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layOutStackView()

        
        // do buttton0
        let btn0 = UIButton(configuration: makeConfig(withtitle: "Play It"), primaryAction: UIAction {action in
                let butn = action.sender as! UIButton
                print(butn.configuration?.title)
            }
        )
        stackView.addArrangedSubview(btn0)
       
        
        // do button 1
        let action = UIAction(title: "flower power") { _ in print("memememem")}
        stackView.addArrangedSubview(makeButton(withtitle: "Pause", doing: { _ in print("memememem")}))

        
        // do button 2
        let btn2 = UIButton(configuration: makeConfig(withtitle: "Stop"), primaryAction: UIAction {action in
                let butn = action.sender as! UIButton
                print(butn.configuration?.title)
            }
        )
        stackView.addArrangedSubview(btn2)
        
        
        
        stackView.addArrangedSubview(makeButton(withtitle: "last one ") {action in
                let butn = action.sender as! UIButton
                print(butn.configuration?.title as Any)
            }
        )
        

}

}
