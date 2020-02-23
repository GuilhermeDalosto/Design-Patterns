//
//  UIViewController+BookShelfInteractor.m
//  ViperObjC
//
//  Created by Guilherme Martins Dalosto de Oliveira on 20/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "BookShelfInteractor.h"


@implementation BookShelfInteractor



- (void) sendBook : (struct Book) book {
    
    _bookShelfController.delegate = self;
    [_bookShelfController printBook: book];
}




//
//- (void) addBook: (struct Book) book{
//    [storageBooks addObject:book]
//}
//
//- (void) removeBook: (struct Book) book{
//    [storageBooks removeObject:book];
//}
//
//- (void) removeBookById: (int) bookId{
//
//    for (int i = 0;i<storageBooks.count;i++){
//        if (storageBooks[i].id == bookId){
//            [storageBooks removeObject:storageBooks[i]];
//            return
//        }
//    }
//}
//
//- (void) removeBookByName: (NSString*) bookName{
//    for (int i = 0;i<storageBooks.count;i++){
//        if (storageBooks[i].name == bookName){
//            [storageBooks removeObject:storageBooks[i]];
//            return
//        }
//    }
//}
//
@end
