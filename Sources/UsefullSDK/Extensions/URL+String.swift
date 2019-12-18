//
//  URL+String.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 11.12.19.
//  Copyright © 2019 Exozet. All rights reserved.
//

import Foundation

extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = URL(string: value)!
    }
}
