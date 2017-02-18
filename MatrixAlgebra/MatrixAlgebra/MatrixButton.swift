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
    var matrix: Matrix
    var row: Int
    var col: Int
    
    init(name: String, matrixParam: Matrix) {
        self.name = name
        matrix = matrixParam
        let size = matrix.getSize()
        row = size.row
        col = size.col
    }
}
