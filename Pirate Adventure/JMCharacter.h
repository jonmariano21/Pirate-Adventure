//
//  JMCharacter.h
//  Pirate Adventure
//
//  Created by JONATHAN MARIANO on 6/18/14.
//
//

#import <Foundation/Foundation.h>
#import "JMArmor.h"
#import "JMWeapon.h"

@interface JMCharacter : NSObject

@property (strong, nonatomic) JMArmor *armor;
@property (strong, nonatomic) JMWeapon *weapon;
@property (nonatomic) int damage;
@property (nonatomic) int health;


@end
