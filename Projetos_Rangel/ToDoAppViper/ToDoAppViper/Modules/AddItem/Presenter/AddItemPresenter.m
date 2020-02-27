//
//  AddItemPresenter.m
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 26/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddItemPresenter.h"

@implementation AddItemPresenter

-(void)createNewItem:(NSString*)name on:(NSDate*)date{
    [self.interactor saveNewItemWithName:name on:date];
}

- (void)taskCompleted {
    [self.router goBackToHomeView];
}


- (void)newItemAddedSucessefull {
    [self.view showOperationResult];
}


@end


