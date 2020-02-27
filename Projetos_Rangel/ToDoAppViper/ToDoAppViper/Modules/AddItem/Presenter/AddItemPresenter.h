//
//  AddItemPresenter.h
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 26/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

#ifndef AddItemPresenter_h
#define AddItemPresenter_h
#import <Foundation/Foundation.h>
#import "AddItensProtocols.h"


@interface AddItemPresenter : NSObject <AddItemViewToPresenterProtocol, AddItemPresenterToInteractorProtocol>

@property (nonatomic,weak) id<AddItemPresenterToViewProtocol> view;

@property (nonatomic,weak) id<AddItemInteractorToPresenterProtocol> interactor;

@property (nonatomic,weak) id<AddItemPresenterToRouterProtocol> router;


@end



#endif /* AddItemPresenter_h */
