//
//  StringExtension.swift
//  FantasyNameGenerator
//
//  Created by Field Employee on 4/6/21.
//

import Foundation

extension String{
    func localization()->String{
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
