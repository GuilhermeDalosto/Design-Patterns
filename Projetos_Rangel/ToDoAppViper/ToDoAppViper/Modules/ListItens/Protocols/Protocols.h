//
//  Protocols.h
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 24/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//
#import <Foundation/Foundation.h>

@protocol PresenterToViewProtocol <NSObject>

-(void)showToDoList:(NSArray*)list;
-(void)setViewName:(NSString*)name;

@end

@protocol InteractorToPresenterProtocol <NSObject>

-(void)fetchLists;
- (NSDate*)getDate;

@end


@protocol PresenterToInteractorProtocol <NSObject>

-(void)showList:(NSArray*)list;
-(void)updateViewName;

@end

@protocol PresenterToRouterProtocol <NSObject>

-(void)goToaddView;

@end


