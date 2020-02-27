//
//  ListInteractor.m
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 24/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListInteractor.h"
#import "StateController.h"
@implementation ListInteractor

- (id)init:(StateController *)stateController{
    self.stateController = stateController;
    [self.stateController.storage fetchData];
    return self;
}

- (NSDate*)getDate{
    self.today = [NSDate date];
    return self.today;
}

- (void)fetchLists {
    [self.stateController.storage fetchData];
    [self.presenter showList:self.stateController.itens];
}



@end
