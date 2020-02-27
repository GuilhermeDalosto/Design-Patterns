//
//  AddInteractor.h
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 24/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#ifndef AddInteractor_h
#define AddInteractor_h

#import <Foundation/Foundation.h>
#import "ListItem.h"
#import "AddItensProtocols.h"
@class StateController;

@interface AddInteractor : NSObject <AddItemInteractorToPresenterProtocol>

@property (nonatomic, strong) StateController *stateController;
@property (nonatomic, weak) id<AddItemPresenterToInteractorProtocol> presenter;
- (id)init:(StateController *)stateController;

@end

#endif /* AddInteractor_h */
