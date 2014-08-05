//
//  System.m
//  ShootEmUp
//
//  Created by frenchdonuts on 8/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "System.h"

@implementation System
- (id)initWithEntityManager:(EntityManager *)entityManager {
    if (self = [super init]) {
        self.entityManager = entityManager;
    }
    return self;
}

- (void)update:(float)dt {}

@end
