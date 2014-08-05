//
//  EntityManager.m
//  ShootEmUp
//
//  Created by frenchdonuts on 8/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "EntityManager.h"

@implementation EntityManager {
    NSMutableArray *_entities;
    NSMutableDictionary *_componentByClass;
    u_int32_t _lowestUnassignedEid;
}
- (id)init {
    if (self = [super init]) {
        _entities = [NSMutableArray array];
        _componentByClass = [NSMutableDictionary dictionary];
        _lowestUnassignedEid = 1;
    }
    return self;
}

- (u_int32_t)generateEid {
    if (_lowestUnassignedEid < UINT32_MAX) {
        return _lowestUnassignedEid++;
    } else {
        for (int i = 1; i < UINT32_MAX; i++) {
            if (![_entities containsObject:@(i)]) {
                return i;
            }
        }
    }
    NSLog(@"ERROR: No available EID!");
    return 0;
}
- (u_int32_t)createNewEntity {
    u_int32_t eid = [self generateEid];
    [_entities addObject:@(eid)];
    return eid;
}
- (void)addComponent:(NSObject<Component> *)component toEntity:(u_int32_t)eid {
    NSMutableArray *components = _componentByClass[NSStringFromClass([component class])];
    if (!components) {
        components = [NSMutableArray array];
        _componentByClass[NSStringFromClass([component class])] = components;
    }
    
    @try {
        components[eid] = component;
    }
    @catch (NSException *exception) {
        NSLog(@"Need to grow");
        [self growArray:components toAccomdateIndex:eid];
        components[eid] = component;
    }
}
- (void)growArray: (NSMutableArray *)array toAccomdateIndex: (u_int32_t)index {
    u_int32_t numNSNulssToAdd = index - array.count;
    for (int i = 0; i < numNSNulssToAdd; i++) {
        [array addObject:[NSNull null]];
    }
}
- (void)removeEntity:(u_int32_t)eid {
    for (NSMutableArray *components in _componentByClass.allValues) {
        if (components[eid]) {
            [components removeObjectAtIndex:eid];
        }
    }
    [_entities removeObject:@(eid)];
}
- (NSArray *)getAllEntitiesPossessingComponentOfClass:(Class)classp {
    NSMutableArray *components = _componentByClass[NSStringFromClass(classp)];
    if (components) {
        NSMutableArray *retVal = [NSMutableArray arrayWithCapacity:components.count];
        for (NSNumber *eid in components) {
            [retVal addObject:eid];
        }
        return retVal;
    } else {
        return [NSMutableArray array];
    }
}

@end
