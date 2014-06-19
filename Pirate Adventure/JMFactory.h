//
//  JMFactory.h
//  Pirate Adventure
//
//  Created by JONATHAN MARIANO on 6/18/14.
//
//

#import <Foundation/Foundation.h>
#import "JMCharacter.h"
#import "JMBoss.h"

@interface JMFactory : NSObject

//METHOD: tiles
-(NSArray *)tiles;

-(JMCharacter *)character;

-(JMBoss *)boss;

@end
