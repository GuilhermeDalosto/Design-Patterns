//
//  UIViewController+BookShelfController.m
//  ViperObjC
//
//  Created by Guilherme Martins Dalosto de Oliveira on 20/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "BookShelfController.h"

@implementation BookShelfController 


-(void) viewDidLoad{
    
}


- (void) printBook : (struct Book) book{
    [_name setText:book.name];
    [_author setText:book.author];
    [_identifier setText:book.identifier];
}



@end
