//
//  AddItemCoordinator.m
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 26/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddItemCoordinator.h"
#import "AddInteractor.h"
#import "AddItemPresenter.h"
#import "AddItemViewController.h"
#import "StateController.h"
#import "StorageController.h"
@implementation AddItemCoordinator

-(id)init:(UINavigationController *)navigationController{
    self.navigationController = navigationController;
    return self;
}
-(void)start{
    AddItemViewController *addVC = [[AddItemViewController alloc] init];
    StorageController *storage = [[StorageController alloc]init];
    StateController *stateController = [[StateController alloc] init:storage];
    AddInteractor *interactor = [[AddInteractor alloc]init:stateController];
    AddItemPresenter *presenter = [[AddItemPresenter alloc] init];
    presenter.interactor = interactor;
    presenter.router = self;
    presenter.view = addVC;
    addVC.presenter = presenter;
    [self.navigationController pushViewController:addVC animated:true];
}



- (void)goBackToHomeView {
    [self.navigationController popViewControllerAnimated:true];
}

@end
