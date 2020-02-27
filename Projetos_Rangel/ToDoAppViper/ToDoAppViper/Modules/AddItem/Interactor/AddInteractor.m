//
//  AddInteractor.m
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 24/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddInteractor.h"
#import "StateController.h"
#import "ListItem.h"

@implementation AddInteractor

- (id)init:(StateController *)stateController{
    self.stateController = stateController;
    return self;
}

-(void)saveNewItemWithName:(NSString*)name on:(NSDate*)date{
    ListItem *item = [[ListItem alloc]init:date name:name];
    [self.stateController add:item];
}
@end
