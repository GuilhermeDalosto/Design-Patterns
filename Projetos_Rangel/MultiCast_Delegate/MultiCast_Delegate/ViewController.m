//
//  ViewController.m
//  MultiCast_Delegate
//
//  Created by Rangel Cardoso Dias on 19/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{

    Robot *robot;
    Person *person;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = [[DelegatorHandler<MenssageDelegate> alloc] init];
    person = [[Person alloc] init];
    robot = [[Robot alloc] init];
    
    [self.delegate addDelegate:person];
    [self.delegate addDelegate:robot];
    
    
}
- (IBAction)buttonAction:(id)sender {
    [self.delegate dispachEvents];
}


@end
