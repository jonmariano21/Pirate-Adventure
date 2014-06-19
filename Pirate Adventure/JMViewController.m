//
//  JMViewController.m
//  Pirate Adventure
//
//  Created by JONATHAN MARIANO on 6/18/14.
//
//

#import "JMViewController.h"
#import "JMFactory.h"
#import "JMTile.h"


@interface JMViewController ()

@end

@implementation JMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Diplay contents of array from Factory Class
    JMFactory *factory = [[JMFactory alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory character];
    self.boss = [factory boss];


    self.currentPoint = CGPointMake(0, 0);
    
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffect:0];
    
    
    [self updateTile];
    
    [self updateButtons];
    
    
    
    
}//Close METHOD: viewDidLoad
/////////////////////////////////////////////////////////////////////////////


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)actionButtonPressed:(UIButton *)sender {
    
    JMTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    
    if( tile.healthEffect == -15 ){
        self.boss.health = self.boss.health - self.character.damage;
    }
    
    [self updateCharacterStatsForArmor: tile.armor withWeapons: tile.weapon withHealthEffect: tile.healthEffect];
    
    if( self.character.health <= 0 ){
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death Message" message:@"You have died, please restart the game" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertView show];
        
    }else if( self.boss.health <= 0 ){
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory Message!" message:@"You have defeated the pirate boss!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertView show];
        
    }
    
    [self updateTile];
    
}

// NORTH BUTTON
- (IBAction)northButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
   
    [self updateButtons]; // now at new point, hide unusable buttons
    
    [self updateTile]; // now at new point, update current tile info
    
}

// WEST BUTTON
- (IBAction)westButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    
    [self updateButtons]; // now at new point, hide unusable buttons
    
    [self updateTile]; // now at new point, update current tile info
    
    
}

//SOUTH BUTTON
- (IBAction)southButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    
    [self updateButtons]; // now at new point, hide unusable buttons
    
    [self updateTile]; // now at new point, update current tile info
    
    
}

// EAST BUTTON
- (IBAction)eastButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    
    [self updateButtons]; // now at new point, hide unusable buttons
    
    [self updateTile]; // now at new point, update current tile info
    
    
}

// RESET BUTTON
- (IBAction)resetButtonPressed:(UIButton *)sender {
    
    self.character = nil; // point to no obj
    self.boss = nil;
    [self viewDidLoad];
    
}

#pragma mark - helper methods

//HELPER METHODS

-(void)updateTile{
    
    JMTile *tileModel = [ [self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y ];
    self.storyLabel.text = tileModel.story;
    self.backgroundImageView.image = tileModel.backgroundImage;
    
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    
    self.armorLabel.text = self.character.armor.name;
    self.weaponLabel.text = self.character.weapon.name;
    
    [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
    
    
    
}//Close updateTile

//UPDATE buttons/HIDE buttons when tile is off grid
-(void)updateButtons{
    self.westButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
    self.eastButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.northButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
    self.southButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
    
}


-(BOOL)tileExistsAtPoint:(CGPoint)point{
    if( point.y >= 0 && point.x >= 0 && point.x < [self.tiles count] && point.y < [ [self.tiles objectAtIndex:point.x] count ] ){
        return NO; //Dont hide compass button
    }else{
        return YES; //Hide compass button
    }
}

//Each tile obj may have an armor, a weapon, or a health effect
-(void)updateCharacterStatsForArmor: (JMArmor *)armor withWeapons: (JMWeapon *)weapon withHealthEffect: (int)healthEffect{
    
    if(armor != nil){
        self.character.health = self.character.health - self.character.armor.health + armor.health;//Remove old armor health and add new armor health
        
        self.character.armor = armor;//changes armor label to new armor
        
    }else if( weapon != nil){
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        
        self.character.weapon = weapon;//changes weapon label to new weapon
        
    }else if( healthEffect != 0 ){
        self.character.health = self.character.health + healthEffect;
    }else{
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }

}




@end
