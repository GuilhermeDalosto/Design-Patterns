//
//  BSInteractorFetcherProtocol.m
//  ViperObjC
//
//  Created by Guilherme Martins Dalosto de Oliveira on 21/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookModel.h"

@protocol FetchBookShelf <NSObject>

//- (struct BookShelf) shareBookShelf;
- (void) shareBookShelf : (struct Book) book;
- (void) printBook: (struct Book) book;

@end
