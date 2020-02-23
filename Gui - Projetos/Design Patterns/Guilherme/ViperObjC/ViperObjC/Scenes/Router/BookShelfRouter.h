//
//  NSObject+BookShelfRouter.h
//  ViperObjC
//
//  Created by Guilherme Martins Dalosto de Oliveira on 20/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookShelfController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookShelfRouter : NSObject

//@property BookShelfController* bookShelf;

- (void) switchView : (NSString*) segueName;

@end

NS_ASSUME_NONNULL_END
