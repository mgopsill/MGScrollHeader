//
//  ScrollableHeaderView.swift
//  MGScrollHeader
//
//  Created by Mike Gopsill on 01/05/2018.
//  Copyright © 2018 Mike Gopsill. All rights reserved.
//

import UIKit

class ScrollableHeaderView: UIView {
    
    public var fadeImage: Bool = false
    
    private var backgroundImageView: UIImageView!
    private var title: UILabel!
    private var subtitle: UILabel!
    private var height: CGFloat!
    private var navigationBarHeight: CGFloat = 64.0
    
    // MARK: Initialisers
    
    init(height: CGFloat) {
        super.init(frame: CGRect())
        self.height = height + navigationBarHeight
        setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        setupBackground()
        setupTitle()
        setupSubtitle()
        setupConstraints()
    }
    
    private func setupBackground() {
        backgroundImageView = UIImageView(image: nil)
        backgroundColor = UIColor(red: 0.09, green: 0.34, blue: 0.55, alpha: 1.0)
    }
    
    private func setupTitle() {
        title = UILabel()
        title.text = "Let there be a title!"
        title.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.thin)
        title.textColor = .white
        title.textAlignment = .center
    }
    
    private func setupSubtitle() {
        subtitle = UILabel()
        subtitle.text = "A great day for a subtitle"
        subtitle.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.thin)
        subtitle.textColor = .white
        subtitle.textAlignment = .center
    }
    
    private func setupConstraints() {
        guard let backgroundImageView = backgroundImageView, let title = title, let subtitle = subtitle else { return }
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(backgroundImageView)
        addSubview(title)
        addSubview(subtitle)
        
        let constraints:[NSLayoutConstraint] = [
            self.heightAnchor.constraint(equalToConstant: height),
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 134.0),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10.0),
            subtitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            subtitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    // Public Methods
    
    public func updateLabelsAlpha(with alpha: CGFloat) {
        title?.textColor = title?.textColor.withAlphaComponent(alpha)
        subtitle?.textColor = subtitle?.textColor.withAlphaComponent(alpha)
        if fadeImage {
            backgroundImageView.alpha = alpha
        }
    }
}
