//
//  HomeCoordinator.h
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 26/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#ifndef HomeCoordinator_h
#define HomeCoordinator_h
#import <Foundation/Foundation.h>
#import "Coordinator.h"
#import <UIKit/UIKit.h>
#import "Protocols.h"
@interface HomeCoordinator : Coordinator <PresenterToRouterProtocol>
-(id)init:(UINavigationController*)navigationController;
@end

#endif /* HomeCoordinator_h */
