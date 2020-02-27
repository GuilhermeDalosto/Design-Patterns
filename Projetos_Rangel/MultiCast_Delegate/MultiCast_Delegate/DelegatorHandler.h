//
//  DelegatorHandler.h
//  MultiCast_Delegate
//
//  Created by Rangel Cardoso Dias on 19/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#ifndef DelegatorHandler_h
#define DelegatorHandler_h

#import <Foundation/Foundation.h>

@protocol MenssageDelegate <NSObject>

-(void)sendMsg;

@end



@interface DelegatorHandler : NSObject

-(void)addDelegate:(id<MenssageDelegate>) delegate;
-(void)removeDelegate:(id<MenssageDelegate>) delegate;
-(void)dispachEvents;

@end






#endif /* DelegatorHandler_h */
