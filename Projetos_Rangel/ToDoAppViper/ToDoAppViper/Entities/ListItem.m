//
//  ListItem.m
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 24/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListItem.h"

@implementation ListItem

-(instancetype)init:(NSDate*)date name:(NSString*)name{
    ListItem *item = [[ListItem alloc]init];
    item.date = date;
    item.name = name;
    item.idItem = [name stringByAppendingString:@"id"];
    item.plistRepresentation = [[NSMutableDictionary alloc] init];
    
    [item setValue:name forKey:@"name"];
    [item setValue:date forKey:@"date"];
    [item setValue:_idItem forKey:@"id"];
    return item;
}

- (instancetype)init:(NSMutableDictionary*)plist
{
    self = [super init];
    if (self) {
        self.date = plist[@"date"];
        self.name = plist[@"name"];
        self.idItem = plist[@"id"];
    }
    return self;
}

@end
