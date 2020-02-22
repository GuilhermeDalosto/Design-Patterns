////
////  NSObject+StateMachine.m
////  ViperObjC
////
////  Created by Guilherme Martins Dalosto de Oliveira on 21/02/20.
////  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
////
//
//#import "StateMachine.h"
//
//@implementation StateMachine
//
//@synthesize currentController;
//@synthesize bookIsOnBookShelf;
//
//- (void) checkController : (UIViewController*) viewControllerDestination {
//    if (viewControllerDestination == currentController){
//        NSLog(@"You already are in this Controller!");
//    } else{
//        NSLog(@"You can go to this Controller!");
//    }
//    
//}
//
//- (void) checkBookShelf : (NSMutableArray*) bookShelf bookCompare: (struct Book) book{
//    for (int i = 0;i<bookShelf.count;i++){
//        if (bookShelf[i] == book){
//            NSLog(@"Book is already on BookShelf!");
//            return
//        }
//    }
//    NSLog(@"You can add to BookShelf!");
//}
//
//@end
