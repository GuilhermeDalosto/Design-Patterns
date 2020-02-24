//
//  NSObject+AddShelfController.m
//  ViperObjC
//
//  Created by Guilherme Martins Dalosto de Oliveira on 21/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "AddShelfController.h"

@implementation AddShelfController



- (void)viewDidLoad{
    
    _presenter = [[BookShelfPresenter alloc] init];
    _router = [[BookShelfRouter alloc]init];
    
    _presenter.router = _router;
    self.delegate = _presenter;
    
    _router.controller = self;
    
}

- (void) send {
    struct Book book;
    book.author = [[self author]text];
    book.identifier = [[self identifier] text];
    book.name = [[self name]text];
    
    [self.delegate shareBookShelf:book];
    
    
}

- (IBAction)AddBook:(UIButton *)sender {
        [self send];
}

@end


