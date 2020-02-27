//
//  StorageController.m
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 24/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//
/*
 
   var documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
   

  var accountsURL: URL {
       return documentDirectory
           .appendingPathComponent("Accounts")
           .appendingPathExtension("plist")
   }
   
   func save(_ accounts: [Account]){
       let accountPlist = accounts.map {$0.plistRepresentation} as NSArray
       do {
           try  accountPlist.write(to: self.accountsURL)
       } catch {
           print(error)
       }
      
       
   }
   
   func fetchAccounts() -> [Account] {
       guard let accountPlists = NSArray(contentsOf: accountsURL) as? [[String: AnyObject]] else {
           return []
       }
       return accountPlists.map(Account.init(plist:))
   }
 */

#import "StorageController.h"
#import "ListItem.h"
@implementation StorageController

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *directory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] componentsJoinedByString:@"listItens"];
        self.documnetDirectory = [[NSURL alloc] initWithString:directory];
    }
    return self;
}


-(void)saveItens:(NSArray*)itens{
    NSArray *newItens = [[NSArray alloc]init];
    for (ListItem* item in itens) {
        newItens = [newItens arrayByAddingObject:item.plistRepresentation];
    }
    @try {
        [newItens writeToURL:self.documnetDirectory atomically:TRUE];
    } @catch (NSException *exception) {
        NSLog(@"Deu Ruim");
    }
}

-(NSArray*)fetchData{
    NSMutableDictionary *data = (NSMutableDictionary*)[[NSArray alloc]initWithContentsOfURL:self.documnetDirectory];
    NSArray *newItens = [[NSArray alloc]init];
    for (NSMutableDictionary* item in data) {
        newItens = [newItens arrayByAddingObject:[[ListItem alloc]init:item]];
    }
    return newItens;
}
@end
