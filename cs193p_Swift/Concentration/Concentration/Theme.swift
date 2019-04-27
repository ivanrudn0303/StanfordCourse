//
//  Theme.swift
//  Concentration
//
//  Created by Ivan Kozlov on 27/04/2019.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import Foundation
import UIKit

class Theme{
    private(set) var labelData = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
         "m", "n", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    private(set) var colorData = [UIColor.black, .orange, .blue, .red, .green, .purple, .white]
    func reload(){
        labelData.shuffle()
        colorData.shuffle()
    }
}
