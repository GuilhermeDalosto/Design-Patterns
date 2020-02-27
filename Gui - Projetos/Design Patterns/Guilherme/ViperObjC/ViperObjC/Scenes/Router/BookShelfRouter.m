//
//  NSObject+BookShelfRouter.m
//  ViperObjC
//
//  Created by Guilherme Martins Dalosto de Oliveira on 20/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "BookShelfRouter.h"

@implementation BookShelfRouter


- (void)viewChange:(nonnull UIViewController *)vc {
    [_controller performSegueWithIdentifier:@"toBookShelf" sender:nil];
}

@end
