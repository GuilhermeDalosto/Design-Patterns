//
//  ListItem.h
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 24/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//
#import <Foundation/Foundation.h>
#ifndef ListItem_h
#define LiListIten



@interface ListItem : NSObject

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *idItem;
@property (nonatomic, strong) NSMutableDictionary *plistRepresentation;

- (id)init:(NSDate*)date name:(NSString*)name;
- (id)init:(NSMutableDictionary*)plist;
@end



#endif /* ListItem_h */
