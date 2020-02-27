//
//  AppCoordinator.m
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 26/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppCoordinator.h"
#import "HomeCoordinator.h"

@implementation AppCoordinator

-(id)init:(UINavigationController*)navigationController{
    self.navigationController = navigationController;
    return self;
}

-(void)start{
    [self showHomeViewController];
}

-(void)showHomeViewController{
    HomeCoordinator *homeCoordinator = [[HomeCoordinator alloc]init:self.navigationController];
    [homeCoordinator start];
    [self.childCoordinators addObject:homeCoordinator];
}

@end
