//
//  Utility.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 9/2/24.
//  Copyright (c) 2024 Praveen P. All rights reserved.
//

import Foundation

extension Bundle {
    private final class Utility { }

    static var MainBundle: Bundle {
        Bundle(for: Utility.self)
    }
}
