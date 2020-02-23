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
#import "BookShelfController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookShelfInteractor : NSObject <FetchBookShelf>

@property (nonatomic,weak) id<FetchBookShelf> delegate;

@property NSString* name;

- (void) sendBook : (struct Book) book;
- (void) addBook : (struct Book) book;
- (void) removeBook: (struct Book) book;
- (void) removeBookById: (int) bookId;
- (void) removeBookByName: (NSString*) bookName;

@end

NS_ASSUME_NONNULL_END
