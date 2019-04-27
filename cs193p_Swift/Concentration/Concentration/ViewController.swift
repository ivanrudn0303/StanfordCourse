//
//  ViewController.swift
//  Concentration
//
//  Created by Ivan Kozlov on 25/04/2019.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var OutputLabel: UILabel!
    @IBOutlet weak var reloadButton: UIButton!
    @IBAction func pressUpOnButton(_ sender: UIButton) {
        guard let ind = CardButton.index(of: sender) else {return}
        let out = model.openCard(index: ind)
        reloadCards(update: out)
    }
    
    var labels = [String]()
    lazy var model = Engine(count: CardButton.count, newlabels: labels)
    let them = Theme()
    
    @IBOutlet var CardButton: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        labels = Array(repeating: " ", count: CardButton.count / 2)
        reload()
    }
    func reload(){
        them.reload()
        self.view.backgroundColor = them.colorData[2]
        for i in 0..<labels.count{
            labels[i] = them.labelData[i]
        }
        model = Engine(count: CardButton.count, newlabels: labels)
        let tmp = model.getState()
        reloadCards(update: tmp)
        OutputLabel.textColor = them.colorData[0]
        reloadButton.setTitleColor(them.colorData[0], for: .normal)
    }
    @IBAction func Restart(_ sender: UIButton) {
        reload()
    }
    
    func reloadCards(update: [CardState]){
        for i in 0..<update.count{
            switch update[i]{
            case .open:
                CardButton[i].setTitle(model.labels[model.identifer[i]], for: .normal)
                CardButton[i].setTitleColor(them.colorData[0], for: .normal)
            case .close:
                CardButton[i].backgroundColor = them.colorData[1]
                CardButton[i].setTitleColor(them.colorData[1], for: .normal)
            case .hide:
                CardButton[i].backgroundColor = UIColor(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0)
                CardButton[i].setTitleColor(UIColor(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0), for: .normal)
            }
        }
        OutputLabel.text = "Score: \(model.score)"
    }
    
}

