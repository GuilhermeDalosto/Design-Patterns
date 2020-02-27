//
//  UIViewController+BookShelfInteractor.m
//  ViperObjC
//
//  Created by Guilherme Martins Dalosto de Oliveira on 20/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "BookShelfInteractor.h"


@implementation BookShelfInteractor



- (void) sendBook{
    
    [self.delegate shareBookShelf:_selectedBook];
    
}

- (void)printBook:(struct Book)book {
    
}


- (void)shareBookShelf:(struct Book)book {
    _selectedBook = book;
    [self sendBook];
    
}




@end
