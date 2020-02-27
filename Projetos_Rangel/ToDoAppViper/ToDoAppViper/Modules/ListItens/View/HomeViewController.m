//
//  HomeViewController.m
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 24/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#import "HomeViewController.h"


@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    ListItem *item = self.itens[indexPath.row];
    cell.textLabel.text = item.name;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itens.count;
}


- (void)setViewName:(NSString *)name {
    self.titleNavigation.title = name;
}

- (void)showToDoList:(NSArray *)list {
    self.itens = list;
    [self.tableView reloadData];
}


@end
