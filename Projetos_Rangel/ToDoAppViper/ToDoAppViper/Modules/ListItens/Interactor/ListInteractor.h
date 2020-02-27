//
//  ListInteractor.h
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 24/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#ifndef ListInteractor_h
#define ListInteractor_h

#import <Foundation/Foundation.h>
#import "ListItem.h"
#import "Protocols.h"

@class StateController;

@interface ListInteractor : NSObject <InteractorToPresenterProtocol>

@property (nonatomic, strong) StateController *stateController;
@property (nonatomic, weak) id<PresenterToInteractorProtocol> presenter;
@property (nonatomic, copy) NSDate * today;
- (id)init:(StateController *)stateController;
@end


#endif /* ListInteractor_h */
