//
//  String+Localized.swift
//  TechTest
//
//  Created by Clément on 2022-03-01.
//

import Foundation

extension String {
  var localized: String { NSLocalizedString(self, comment: "") }
}
