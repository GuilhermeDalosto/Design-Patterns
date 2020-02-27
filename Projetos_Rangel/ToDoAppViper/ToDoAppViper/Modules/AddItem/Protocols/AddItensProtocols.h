//
//  AddItensProtocols.h
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 26/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "ListItem.h"

@protocol AddItemPresenterToViewProtocol <NSObject>


-(void)showOperationResult;

@end


@protocol AddItemViewToPresenterProtocol <NSObject>

-(void)createNewItem:(NSString*)name on:(NSDate*)date;
-(void)taskCompleted;

@end

@protocol AddItemInteractorToPresenterProtocol <NSObject>

-(void)saveNewItemWithName:(NSString*)name on:(NSDate*)date;
@end


@protocol AddItemPresenterToInteractorProtocol <NSObject>

-(void)newItemAddedSucessefull;

@end

@protocol AddItemPresenterToRouterProtocol <NSObject>

-(void)goBackToHomeView;

@end
