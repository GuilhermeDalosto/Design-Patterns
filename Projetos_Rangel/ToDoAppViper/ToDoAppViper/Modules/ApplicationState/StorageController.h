//
//  StorageController.h
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 24/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#ifndef StorageController_h
#define StorageController_h
#import <Foundation/Foundation.h>

@interface StorageController : NSObject

@property (nonatomic, nonnull) NSURL *documnetDirectory;
-(void)saveItens:(NSArray*_Nullable)itens;
-(NSArray*_Nullable)fetchData;
@end

#endif /* StorageController_h */
