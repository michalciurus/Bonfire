//
//  CompletionEvent.swift
//  RxSugar
//
//  Created by Michal Ciurus on 24/01/17.
//  Copyright © 2017 MichalCiurus. All rights reserved.
//

import Foundation
import RxSwift

public class CompletionEvent<T>: ObservableType {
    public typealias E = T
    private let subject: PublishSubject<E>
    
    public init() {
        subject = PublishSubject<E>()
    }
    
    public func subscribe<O: ObserverType>(_ observer: O) -> Disposable where O.E == E {
        return subject
            .observeOn(MainScheduler.instance)
            .subscribe(observer)
    }
    
    public func bindTo(observable: Observable<E>) {
        observable
            .subscribe(onNext: { [weak self] element in
                self?.subject.onNext(element)
                self?.subject.onCompleted()
            })
    }
    
    public func fireEvent(element: E) {
        subject.onNext(element)
    }
    
}
