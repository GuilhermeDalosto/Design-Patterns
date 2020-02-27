//
//  NSObject+BookShelfRouter.h
//  ViperObjC
//
//  Created by Guilherme Martins Dalosto de Oliveira on 20/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AlertRouter.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BookShelfRouter : NSObject <AlertRouter>

@property UIViewController* controller;


@end

NS_ASSUME_NONNULL_END
