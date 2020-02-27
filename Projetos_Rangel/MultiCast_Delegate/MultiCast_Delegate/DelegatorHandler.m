//
//  DelegatorHandler.m
//  MultiCast_Delegate
//
//  Created by Rangel Cardoso Dias on 19/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//
#import "DelegatorHandler.h"
@implementation DelegatorHandler{
    NSHashTable *delegates;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        delegates = [NSHashTable weakObjectsHashTable];
    }
    return self;
}

-(void)addDelegate:(id<MenssageDelegate>) delegate{
    [delegates addObject:delegate];
}
-(void)removeDelegate:(id<MenssageDelegate>) delegate{
    [delegates removeObject:delegate];
}

-(void)dispachEvents{
    for (id delegate in delegates) {
        [delegate sendMsg];
    }
}

@end
