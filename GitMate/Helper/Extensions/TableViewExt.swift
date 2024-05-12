//
//  TableViewExt.swift
//  GitMate
//
//  Created by Yomna Othman on 12/05/2024.
//

import Foundation
import UIKit

extension UITableView {
    
    func setImage(_ image: UIImage) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        self.backgroundView = imageView;
    }
    
    func restore() {
        self.backgroundView = nil
    }
}
