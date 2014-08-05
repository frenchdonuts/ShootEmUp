//
//  EntityManager+EntityFactory.h
//  ShootEmUp
//
//  Created by frenchdonuts on 8/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "EntityManager.h"

@interface EntityManager (EntityFactory)

- (u_int32_t)createHumanPlayer;
- (u_int32_t)createEnemyShip;

@end
