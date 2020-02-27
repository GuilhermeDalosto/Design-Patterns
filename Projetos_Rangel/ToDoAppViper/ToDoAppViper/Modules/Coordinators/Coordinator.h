//
//  Coordinator.h
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 26/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#ifndef Coordinator_h
#define Coordinator_h
#import <UIKit/UIKit.h>

@interface Coordinator : NSObject

@property (nonatomic) NSHashTable* childCoordinators;
@property (nonatomic, strong) UINavigationController *navigationController;

-(void)start;
-(id)init:(UINavigationController*)navigationController;
@end


#endif /* Coordinator_h */
/*
 
 
 
 var childCoordinators: [Coordinator] = []
 var navigationController: UINavigationController

 func start(){
     
 }
 init(with navigationController: UINavigationController) {
       self.navigationController = navigationController
   }
 */

