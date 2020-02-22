//
//  NSObject+AddShelfController.h
//  ViperObjC
//
//  Created by Guilherme Martins Dalosto de Oliveira on 21/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BookShelfInteractor.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddShelfController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *author;
@property (weak, nonatomic) IBOutlet UITextField *identifier;

@property (nonatomic,weak) id<FetchBookShelf> delegate;
@property  BookShelfInteractor* interactor;

- (void) send;
- (IBAction)AddBook:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
