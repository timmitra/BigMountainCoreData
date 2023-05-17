//
//  ParksEntityExtension.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-05-16.
//

import UIKit
import CoreData

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

extension ParkEntity {
    
    static var firstFive: NSFetchRequest<ParkEntity> {
        let request = ParkEntity.fetchRequest()
        
        request.sortDescriptors = [NSSortDescriptor(keyPath: \ParkEntity.name, ascending: true)]
        request.fetchLimit = 5
        
        return request
    }
}
