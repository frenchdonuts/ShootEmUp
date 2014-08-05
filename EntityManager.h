//
//  EntityManager.h
//  ShootEmUp
//
//  Created by frenchdonuts on 8/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Component.h"

@interface EntityManager : NSObject

- (u_int32_t)generateEid;
- (u_int32_t)createNewEntity;
- (void)addComponent: (NSObject<Component> *)component toEntity: (u_int32_t)eid;
- (NSObject<Component> *)getComponentOfClass: (Class)classp forEntity: (u_int32_t)eid;
- (void)removeEntity: (u_int32_t)entity;
- (NSArray *)getAllEntitiesPossessingComponentOfClass: (Class)classp;

@end
