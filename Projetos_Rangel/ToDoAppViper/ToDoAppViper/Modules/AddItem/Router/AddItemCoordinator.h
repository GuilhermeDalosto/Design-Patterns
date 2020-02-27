//
//  AddItemCoordinator.h
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 26/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#ifndef AddItemCoordinator_h
#define AddItemCoordinator_h
#import <Foundation/Foundation.h>
#import "Coordinator.h"
#import <UIKit/UIKit.h>
#import "AddItensProtocols.h"
@interface AddItemCoordinator : Coordinator <AddItemPresenterToRouterProtocol>
-(id)init:(UINavigationController*)navigationController;
@end

#endif /* AddItemCoordinator_h */
