//
//  System.h
//  ShootEmUp
//
//  Created by frenchdonuts on 8/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EntityManager.h"

@interface System : NSObject
@property (strong) EntityManager *entityManager;
- (id)initWithEntityManager: (EntityManager *) entityManager;

- (void)update: (float)dt;

@end
