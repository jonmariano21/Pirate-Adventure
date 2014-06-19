//
//  JMTile.h
//  Pirate Adventure
//
//  Created by JONATHAN MARIANO on 6/18/14.
//
//

#import <Foundation/Foundation.h>
#import "JMWeapon.h"
#import "JMArmor.h"


@interface JMTile : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *backgroundImage;//each tile has its own background image
@property (strong, nonatomic) NSString *actionButtonName;
@property (strong, nonatomic) JMWeapon *weapon;
@property (strong, nonatomic) JMArmor *armor;
@property (nonatomic) int healthEffect;


@end
