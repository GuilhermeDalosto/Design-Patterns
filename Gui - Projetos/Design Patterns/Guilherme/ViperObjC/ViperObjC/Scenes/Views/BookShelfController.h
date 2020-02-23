//
//  UIViewController+BookShelfController.h
//  ViperObjC
//
//  Created by Guilherme Martins Dalosto de Oliveira on 20/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "BookModel.h"
#import "BookShelfInteractor.h"
#import "BookShelfRouter.h"
#import "BookShelfPresenter.h"
#import "BSInteractorFetcherProtocol.h"
#import "AddShelfController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookShelfController : UIViewController <FetchBookShelf>

@property AddShelfController* addShelfController;

@property (retain) BookShelfInteractor* interactor;
//@property BookShelfRouter* router;
@property BookShelfPresenter* presenter;



@end

NS_ASSUME_NONNULL_END
