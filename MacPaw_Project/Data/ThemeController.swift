//
//  ThemeController.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/18/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation
enum Theme: String {
    case light
    case dark
    case black
}


class ThemeController {
    private(set) lazy var currentTheme = loadTheme()
    private let defaults: UserDefaults
    private let defaultsKey = "theme"
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    func changeTheme(to theme: Theme) {
        currentTheme = theme
        defaults.setValue(theme.rawValue, forKey: defaultsKey)
    }
    
    private func loadTheme() -> Theme {
        let rawValue = defaults.string(forKey: defaultsKey)
        
        if(rawValue == nil){
            return Theme.light
        }
        return Theme(rawValue: rawValue!)!
    }
}
