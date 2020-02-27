//
//  StateController.m
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 24/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//
/*
 let storageController: StorageController!
  var accounts: [Account]!
  
  init(storageController: StorageController) {
      self.storageController = storageController
      self.accounts = self.storageController.fetchAccounts()
  }
  
  func add(_ account: Account){
      accounts.append(account)
      storageController.save(accounts)
  }
  
  func updateAccount(_ account: Account){
      for (index, accountStoraged) in accounts.enumerated() {
          if accountStoraged.number == account.number{
              accounts[index] = account
              storageController.save(accounts)
          }
      }
  }
 */
#import <Foundation/Foundation.h>
#import "StateController.h"
@implementation StateController

-(id)init:(StorageController*)storageController{
    self.storage = storageController;
    return self;
}

-(void)add:(ListItem*)item{
    self.itens = [self.itens arrayByAddingObject:item];
    [self.storage saveItens:self.itens];
}

-(void)updateItem:(ListItem*)item{
    int index = -1;
    for (int i = 0; i < self.itens.count; i++) {
        if ([self.itens[i] idItem] == item.idItem){
            index = i;
        }
    }
    if (index != -1){
        ListItem *new = self.itens[index];
         new = item;
    }
}
@end
