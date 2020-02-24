//
//  UIViewController+BookShelfController.h
//  ViperObjC
//
//  Created by Guilherme Martins Dalosto de Oliveira on 20/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "BookModel.h"
#import "BSInteractorFetcherProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookShelfController : UIViewController <FetchBookShelf>

@property (nonatomic,weak) id<FetchBookShelf> delegate;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *identifier;


@end

NS_ASSUME_NONNULL_END
