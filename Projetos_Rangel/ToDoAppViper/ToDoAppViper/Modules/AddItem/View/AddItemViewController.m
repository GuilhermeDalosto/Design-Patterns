//
//  AddItemViewController.m
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 26/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)createItem:(id)sender {
    [self.presenter createNewItem:self.taskNameTextField.text on:self.datePeacker.date];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)showOperationResult {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Item" message:@"Item successfully created" preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {
        [self.presenter taskCompleted];
    }];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
