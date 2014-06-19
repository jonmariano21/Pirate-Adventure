//
//  JMFactory.m
//  Pirate Adventure
//
//  Created by JONATHAN MARIANO on 6/18/14.
//
//

#import "JMFactory.h"
#import "JMTile.h"

@implementation JMFactory

//METHOD: tiles
-(NSArray *)tiles{
    
    //Create Tile objs
    
    JMTile *tile1 = [[JMTile alloc] init];
    tile1.story = @"Captain, we need a fearless leader like Jonathan Mariano to undertake this voyage. We must defeat the evil pirate boss! Take this blunted sword.";
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    JMWeapon *bluntedSword = [[JMWeapon alloc] init];
    bluntedSword.name = @"Blunted Sword";
    bluntedSword.damage = 12;
    tile1.weapon = bluntedSword;
    tile1.actionButtonName = @"Take the Sword";
    
    JMTile *tile2 = [[JMTile alloc] init];
    tile2.story = @"You have come accross an armory. Would you like to upgrade your armor?";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    JMArmor *steelArmor = [[JMArmor alloc] init];
    steelArmor.name = @"Steel Armor";
    steelArmor.health = 8;
    tile2.armor = steelArmor;
    tile2.actionButtonName = @"Take the Steel Armor";
    
    JMTile *tile3 = [[JMTile alloc] init];
    tile3.story = @"A mysterious dock appears on the horizon. Should we stop and get directions?";
    tile3.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile3.healthEffect = 12;
    tile3.actionButtonName = @"Stop at the doc";
    
    
    //firstColumn container
    NSMutableArray *firstColumn = [[NSMutableArray alloc] init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
    
    JMTile *tile4 = [[JMTile alloc] init];
    tile4.story = @"You have found a parrot! Parrots can be used for armor in that they are loyal and protect their Captain.";
    tile4.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    JMArmor *parrotArmor = [[JMArmor alloc] init];
    parrotArmor.health = 20;
    parrotArmor.name = @"Parrot";
    //tile4.armor = parrotArmor;
    tile4.actionButtonName = @"Take the parrot";
    
    
    JMTile *tile5 = [[JMTile alloc] init];
    tile5.story = @"You have stumbled upon some pirate weapons! Would you like to upgrade your weapon to a pistol?";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    JMWeapon *pistolWeapon = [[JMWeapon alloc] init];
    pistolWeapon.name = @"Pistol";
    pistolWeapon.damage = 17;
    //tile5.weapon = pistolWeapon;
    tile5.actionButtonName = @"Use the pistol";

    
    
    JMTile *tile6 = [[JMTile alloc] init];
    tile6.story = @"You have been captured by pirates and have been ordered to walk the plank";
    tile6.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.healthEffect = -22;
    tile6.actionButtonName = @"Show no fear!";
    

    
    //secondColumn container
    NSMutableArray *secondColumn = [[NSMutableArray alloc] init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];
    
    JMTile *tile7 = [[JMTile alloc] init];
    tile7.story = @"You have sited a pirate battle off the coast. Should we intervene?";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile7.healthEffect = 8;
    tile7.actionButtonName = @"Fight those scum";


    
    JMTile *tile8 = [[JMTile alloc] init];
    tile8.story = @"The legend of the deep the mighty Kraken appears!";
    tile8.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile8.healthEffect = -46;
    tile8.actionButtonName = @"Abandon ship!";


    
    JMTile *tile9 = [[JMTile alloc] init];
    tile9.story = @"You have stumbled upon a hidden cave of pirate treasure!";
    tile9.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile9.healthEffect = 20;
    tile9.actionButtonName = @"Take treasure";


    
    //thirdColumn container
    NSMutableArray *thirdColumn = [[NSMutableArray alloc] init];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];
    
    
    JMTile *tile10 = [[JMTile alloc] init];
    tile10.story = @"A group of pirates attempt to board your ship.";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.healthEffect = -15;
    tile10.actionButtonName = @"Repell invaders";

    

    
    JMTile *tile11 = [[JMTile alloc] init];
    tile11.story = @"In the deep of the sea, many things live and many things can be found. Will the fortune bring help or ruin?";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.healthEffect = -7;
    tile11.actionButtonName = @"Swim deeper";


    
    JMTile *tile12 = [[JMTile alloc] init];
    tile12.story = @"Your final battle with the evil pirate boss!";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.healthEffect = -15;
    tile12.actionButtonName = @"FIGHT!";


    
    //fourthColumn container
    NSMutableArray *fourthColumn = [[NSMutableArray alloc] init];
    [fourthColumn addObject:tile10];
    [fourthColumn addObject:tile11];
    [fourthColumn addObject:tile12];
    
    //ARRAY with Columns
    NSArray *tiles = [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
                      
    return tiles;
                      
} //Close METHOD: tiles

//METHOD: characterName
-(JMCharacter *)character{
    
    JMCharacter *character = [[JMCharacter alloc] init];//Create a character
    character.health = 100;
    
    JMArmor *armor = [[JMArmor alloc] init];//Create armor
    armor.name = @"Cloak";
    
    armor.health = 5;//Health
    
    character.armor = armor;
    
    JMWeapon *weapon = [[JMWeapon alloc] init];//Create weapon
    weapon.name = @"Fists";
    weapon.damage = 10;
    character.weapon = weapon;
    
    
    
    return character;
    
}//Close METHOD: characterName

//METHOD: boss
-(JMBoss *)boss{
    JMBoss *boss = [[JMBoss alloc] init];
    boss.health = 65;
    
    return boss;
    
}













@end
