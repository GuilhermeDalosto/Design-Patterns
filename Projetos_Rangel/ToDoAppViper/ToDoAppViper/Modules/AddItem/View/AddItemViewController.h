//
//  AddItemViewController.h
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 26/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddItensProtocols.h"
NS_ASSUME_NONNULL_BEGIN

@interface AddItemViewController : UIViewController <AddItemPresenterToViewProtocol>
@property (weak, nonatomic) IBOutlet UITextField *taskNameTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePeacker;

@property (weak, nonatomic) IBOutlet UIButton *createItem;
@property (weak, nonatomic) id<AddItemViewToPresenterProtocol> presenter;
@end

NS_ASSUME_NONNULL_END
