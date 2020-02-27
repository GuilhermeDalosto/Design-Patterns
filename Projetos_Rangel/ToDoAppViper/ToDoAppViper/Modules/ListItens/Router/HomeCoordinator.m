//
//  HomeCoordinator.m
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 26/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeCoordinator.h"
#import "HomeViewController.h"
#import "ListInteractor.h"
#import "StorageController.h"
#import "StateController.h"
#import "ItensPresenter.h"
#import "AddItemCoordinator.h"

@implementation HomeCoordinator

-(id)init:(UINavigationController *)navigationController{
    self.navigationController = navigationController;
    return self;
}
-(void)start{
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    StorageController *storage = [[StorageController alloc]init];
    StateController *stateController = [[StateController alloc] init:storage];
    ListInteractor *interactor = [[ListInteractor alloc]init:stateController];
    ItensPresenter *presenter = [[ItensPresenter alloc] init];
    presenter.interactor = interactor;
    presenter.router = self;
    presenter.view = homeVC;
    [self.navigationController pushViewController:homeVC animated:true];
    
}

-(void)goToaddView{
    AddItemCoordinator *addCoordinator = [[AddItemCoordinator alloc] init:self.navigationController];
    [addCoordinator start];
    [self.childCoordinators addObject:addCoordinator];
}



@end
