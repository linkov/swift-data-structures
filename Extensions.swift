//
//  Extentions.swift
//  SwiftDataStructuresDemo
//
//  Created by alex on 1/14/15.
//  Copyright (c) 2015 SDWR. All rights reserved.
//

import Foundation

extension Array {
    func isSorted(isOrderedBefore: (T, T) -> Bool) -> Bool {
        for i in 1..<self.count {
            if !isOrderedBefore(self[i-1], self[i]) {
                return false
            }
        }
        return true
    }
}
