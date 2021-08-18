//
//  Bindable.swift
//  Emoji
//
//  Created by Any Ambria on 16/08/21.
//

import Foundation

class Bindable<T> {
    typealias BindType = ((T) -> Void)
    
    private var binds: [BindType] = []
    
    var value: T {
        didSet {
            execBinds()
        }
    }
    
    init(_ val: T) {
        value = val
    }
    
    func bind(skip: Bool = false, _ bind: @escaping BindType) {
        binds.append(bind)
        if skip {
            return
        }
        bind(value)
    }
    
    private func execBinds() {
        binds.forEach { [unowned self] bind in
            bind(self.value)
        }
    }
}
