//
//  UIImage+load.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 16/01/2023.
//

import SDWebImage

extension UIImageView {
    func load(with url: String, placeHolder: UIImage? = UIImage()) {
        guard let url = URL(string: url) else { return }
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_setImage(with: url,
                         placeholderImage: placeHolder,
                         options: .continueInBackground,
                         completed: nil)
    }
}
