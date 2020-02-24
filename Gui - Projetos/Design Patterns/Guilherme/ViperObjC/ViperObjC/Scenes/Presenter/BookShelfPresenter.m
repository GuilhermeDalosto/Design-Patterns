//
//  NSObject+BookShelfPresenter.m
//  ViperObjC
//
//  Created by Guilherme Martins Dalosto de Oliveira on 20/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "BookShelfPresenter.h"
#import "BookModel.h"

@implementation BookShelfPresenter



- (void) sendInteractor{
    _interactor = [[BookShelfInteractor alloc]init];
    _bsController = [[BookShelfController alloc]init];
    
    
    self.delegate = _bsController;
    [self.delegate printBook:_book];
    
    self.delegateRouter = _router;
    [self.delegateRouter viewChange:_bsController];
    
    
    
    
    

}

- (void)printBook:(struct Book)book {
    
}

- (void)shareBookShelf:(struct Book)book {
    _book = book;
    NSLog(@"%@",book.name);
    NSLog(@"%@",book.author);
    NSLog(@"%@",book.identifier);
    [self sendInteractor];
}



@end
