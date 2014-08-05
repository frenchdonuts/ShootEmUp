//
//  HealthComponent.h
//  ShootEmUp
//
//  Created by frenchdonuts on 8/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Component.h"

@interface HealthComponent : NSObject<Component>
@property (assign) float curHp;
@property (assign) float maxHp;
@property (assign) BOOL alive;
- (id)initWithCurHp: (float)curHp maxHp: (float)maxHp;

@end
