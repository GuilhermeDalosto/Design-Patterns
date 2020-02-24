//
//  NSObject+BookShelfPresenter.h
//  ViperObjC
//
//  Created by Guilherme Martins Dalosto de Oliveira on 20/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookModel.h"
#import "BookShelfController.h"
#import "BookShelfInteractor.h"
#import "BSInteractorFetcherProtocol.h"
#import "AlertRouter.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookShelfPresenter : NSObject <FetchBookShelf>

@property struct Book book;

@property BookShelfInteractor* interactor;
@property BookShelfController* bsController;
@property UIViewController* router;
@property (nonatomic,weak) id<FetchBookShelf> delegate;
@property (nonatomic,weak) id<AlertRouter> delegateRouter;

- (void) sendInteractor;


@end

NS_ASSUME_NONNULL_END
