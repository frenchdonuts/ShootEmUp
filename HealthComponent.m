//
//  HealthComponent.m
//  ShootEmUp
//
//  Created by frenchdonuts on 8/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "HealthComponent.h"

@implementation HealthComponent
- (id)initWithCurHp:(float)curHp maxHp:(float)maxHp {
    if (self = [super init]) {
        self.curHp = curHp;
        self.maxHp = maxHp;
        self.alive = YES;
    }
    return self;
}

@end
