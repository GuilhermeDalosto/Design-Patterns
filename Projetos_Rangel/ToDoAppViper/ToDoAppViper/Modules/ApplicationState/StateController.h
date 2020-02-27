//
//  StateController.h
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 24/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#ifndef StateController_h
#define StateController_h
#import <Foundation/Foundation.h>
#import "StorageController.h"
#import "ListItem.h"

@interface StateController : NSObject

@property (nonatomic, nonnull) StorageController *storage;
@property  (nonatomic, copy) NSArray *itens;

-(id)init:(StorageController*)storageController;
-(void)add:(ListItem*)item;
-(void)updateItem:(ListItem*)item;
@end
#endif /* StateController_h */
