//
//  NSObject+StateMachine.h
//  ViperObjC
//
//  Created by Guilherme Martins Dalosto de Oliveira on 21/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BookModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface StateMachine : NSObject

@property UIViewController* currentController;
@property Boolean bookIsOnBookShelf;

@end

NS_ASSUME_NONNULL_END
