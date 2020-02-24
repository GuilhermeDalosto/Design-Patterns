//
//  FetchDatabase.swift
//  MVVM
//
//  Created by Guilherme Martins Dalosto de Oliveira on 24/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation

protocol FetchDatabase{
    func performFetch<T>() -> T;
}
