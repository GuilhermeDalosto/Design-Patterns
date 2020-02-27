//
//  itensPresenter.h
//  ToDoAppViper
//
//  Created by Rangel Cardoso Dias on 24/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//


#ifndef itensPresenter_h
#define itensPresenter_h
#import <Foundation/Foundation.h>
#import "Protocols.h"


@interface ItensPresenter : NSObject <PresenterToInteractorProtocol>

@property (nonatomic,weak) id<PresenterToViewProtocol> view;

@property (nonatomic,weak) id<InteractorToPresenterProtocol> interactor;

@property (nonatomic,weak) id<PresenterToRouterProtocol> router;

@end


#endif /* itensPresenter_h */
/*
 
 var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
 */
