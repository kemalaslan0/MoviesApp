//
//  WMBodyLabel.swift
//  MoviesApp
//
//  Created by Kemal Aslan on 12.12.2022.
//

import UIKit

class WMBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
        numberOfLines = 0
        lineBreakMode = .byTruncatingTail
    }
}
