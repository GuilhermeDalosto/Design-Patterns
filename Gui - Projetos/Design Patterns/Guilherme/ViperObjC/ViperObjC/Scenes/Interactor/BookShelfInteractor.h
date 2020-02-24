//
//  UIViewController+BookShelfInteractor.h
//  ViperObjC
//
//  Created by Guilherme Martins Dalosto de Oliveira on 20/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookModel.h"
#import "BSInteractorFetcherProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookShelfInteractor : NSObject <FetchBookShelf>

@property (nonatomic) struct Book selectedBook;
@property (nonatomic,weak) id<FetchBookShelf> delegate;


- (void) sendBook;
- (void) printBook:(struct Book)book;

@end

NS_ASSUME_NONNULL_END
