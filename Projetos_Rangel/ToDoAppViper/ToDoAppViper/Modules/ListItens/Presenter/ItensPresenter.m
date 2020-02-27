//
//  ItensPresenter.m
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 24/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItensPresenter.h"

@implementation ItensPresenter

-(void)showAddItemView{
    [self.router goToaddView];
}

-(void)updateViewName{
    NSDate *today = [self.interactor getDate];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:today];
    [self.view setViewName:dateString];
}

- (void)showList:(NSArray *)list {
    [self.view showToDoList:list];
}

@end


