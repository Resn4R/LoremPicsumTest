//
//  RandyRandoPic.swift
//  Lorem Picsum
//
//  Created by Vito Borghi on 13/10/2023.
//
import SwiftData
import Foundation

@Model
class RandyRandyPic {
    @Attribute (.externalStorage) var image: Data
    
    init(image: Data) {
        self.image = image
    }
}
