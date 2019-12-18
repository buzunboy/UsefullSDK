//
//  Orientable.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 06.06.19.
//  Copyright © 2019 Exozet. All rights reserved.
//

import UIKit

/**
View Controllers who conform that protocol, will mark themselves as only accepting landscape orientation.
*/
protocol Landscapeable: UIViewController { }

/**
View Controllers who conform that protocol, will mark themselves as only accepting portrait orientation.
*/
protocol Portaiteable: UIViewController { }

/**
 View Controllers who conform that protocol, will mark themselves as accepting all screen rotations.
 */
protocol AllOrientateable: UIViewController { }
