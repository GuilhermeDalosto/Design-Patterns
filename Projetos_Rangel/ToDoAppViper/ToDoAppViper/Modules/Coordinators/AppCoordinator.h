//
//  AppCoordinator.h
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 26/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#ifndef AppCoordinator_h
#define AppCoordinator_h
#import <Foundation/Foundation.h>
#import "Coordinator.h"
#import <UIKit/UIKit.h>
@interface AppCoordinator : Coordinator


-(id)init:(UINavigationController*)navigationController;
-(void)showHomeViewController;
@end
#endif /* AppCoordinator_h */
