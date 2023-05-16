//
//  ParksEntityExtension.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-05-16.
//

import UIKit

//Handle nils and formatting

extension ParkEntity {
    var viewImage: UIImage {
        if let data = image, let image = UIImage(data: data) {
            return image
        } else  {
            return UIImage(systemName: "photo")! // SF Symbol
        }
    }
    var viewName: String {
        name ?? "[No Park Name]"
    }
    var viewRegion: String {
        region ?? "N/A"
    }
    var viewCountry: String {
        country ?? "N/A"
    }
    var viewLocation: String {
        viewRegion + ", " + viewCountry
    }
    var viewRating: String {
        "\(rating).circle.fill"
    }
}
