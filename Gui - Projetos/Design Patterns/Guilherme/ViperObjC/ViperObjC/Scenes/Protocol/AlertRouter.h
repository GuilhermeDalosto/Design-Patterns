//
//  NSObject+AlertRouter.h
//  ViperObjC
//
//  Created by Guilherme Martins Dalosto de Oliveira on 22/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AlertRouter <NSObject>

-(void) viewChange: (UIViewController*) vc;

@end

NS_ASSUME_NONNULL_END
