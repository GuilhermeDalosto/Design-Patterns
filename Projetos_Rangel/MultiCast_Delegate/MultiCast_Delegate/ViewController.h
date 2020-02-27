//
//  ViewController.h
//  MultiCast_Delegate
//
//  Created by Rangel Cardoso Dias on 19/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DelegatorHandler.h"
#import "Robot.h"
#import "Person.h"

@interface ViewController : UIViewController


@property DelegatorHandler <MenssageDelegate>* delegate;

@end

