//
//  MatrixButton.swift
//  MatrixAlgebra
//
//  Created by Tai Kao-Sowa on 2/18/17.
//  Copyright © 2017 Tai Kao-Sowa. All rights reserved.
//

import Foundation
import UIKit

struct MatrixButton {
    var name: String
    var butToMatrix: Matrix
    var row: Int
    var col: Int
    
    init(name: String, butToMatrix: Matrix, row: Int, col: Int) {
        self.name = name
        self.butToMatrix = butToMatrix
        self.row = row
        self.col = col
    }
}
