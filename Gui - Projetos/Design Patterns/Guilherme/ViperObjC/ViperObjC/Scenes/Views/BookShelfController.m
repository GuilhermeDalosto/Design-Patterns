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
    _interactor = [[BookShelfInteractor alloc] init];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"segueAddShelf"]){
        AddShelfController *vc = (AddShelfController *)segue.destinationViewController;
        _interactor.name = @"AAA";
        vc.interactor = _interactor;

        
    }
}



- (void) printBook : (struct Book) book{
    NSLog(@"Received Struct");
    NSLog(@"%@",book.name);
    NSLog(@"%@",book.author);
    NSLog(@"%d",book.identifier);
}

-(void) addToBookShelf : (struct Book) book{
    [[self interactor]addBook: book];
}

-(void) removeOfBookShelf : (struct Book) book{
    [[self interactor]removeBook: book];
}

-(void) changeView : (NSString*) segueName{
    //[[self router]switchView:segueName];
}



@end
