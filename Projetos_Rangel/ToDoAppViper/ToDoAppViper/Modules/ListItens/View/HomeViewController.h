//
//  HomeViewController.h
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 24/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Protocols.h"
#import "ListItem.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController <PresenterToViewProtocol, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UIBarButtonItem* addButton;
@property (nonatomic, weak) IBOutlet    UITableView*   tableView;

@property (nonatomic, weak) IBOutlet    UINavigationItem* titleNavigation;
@property (nonatomic, strong) NSArray* itens;
@end

NS_ASSUME_NONNULL_END
