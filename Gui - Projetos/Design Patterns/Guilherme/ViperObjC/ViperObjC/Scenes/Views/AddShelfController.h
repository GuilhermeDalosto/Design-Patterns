//
//  NSObject+AddShelfController.h
//  ViperObjC
//
//  Created by Guilherme Martins Dalosto de Oliveira on 21/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BookShelfPresenter.h"
#import "BookShelfRouter.h"
#import "BSInteractorFetcherProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddShelfController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *author;
@property (weak, nonatomic) IBOutlet UITextField *identifier;
@property BookShelfPresenter* presenter;
@property BookShelfRouter* router;
@property (nonatomic,weak) id<FetchBookShelf> delegate;


- (void) send;
- (IBAction)AddBook:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
