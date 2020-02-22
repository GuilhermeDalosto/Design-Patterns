//
//  NSObject+BookShelfPresenter.h
//  ViperObjC
//
//  Created by Guilherme Martins Dalosto de Oliveira on 20/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookShelfPresenter : NSObject

@property struct Book book;

- (struct Book) showBookInfo : (int) idBook;

@end

NS_ASSUME_NONNULL_END
