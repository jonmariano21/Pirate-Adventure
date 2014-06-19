//
//  JMViewController.h
//  Pirate Adventure
//
//  Created by JONATHAN MARIANO on 6/18/14.
//
//

#import <UIKit/UIKit.h>
#import "JMCharacter.h"
#import "JMBoss.h"


@interface JMViewController : UIViewController

//Instance vars
@property (nonatomic) CGPoint currentPoint;
@property (strong, nonatomic) NSArray *tiles;
@property (strong, nonatomic) JMCharacter *character;
@property (strong, nonatomic) JMBoss *boss;


//BACKGROUND
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView; //Background image

//IBOutlets
@property (strong, nonatomic) IBOutlet UILabel *healthLabel; //Health Number
@property (strong, nonatomic) IBOutlet UILabel *damageLabel; //Damage Number
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel; //Weapon Name
@property (strong, nonatomic) IBOutlet UILabel *armorLabel; //Armor Name
@property (strong, nonatomic) IBOutlet UILabel *storyLabel; //Story

//IBOutlets --> BUTTONS
@property (strong, nonatomic) IBOutlet UIButton *actionButton;
//Compass
@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;

//IBActions
- (IBAction)actionButtonPressed:(UIButton *)sender;
- (IBAction)northButtonPressed:(UIButton *)sender;
- (IBAction)westButtonPressed:(UIButton *)sender;
- (IBAction)southButtonPressed:(UIButton *)sender;
- (IBAction)eastButtonPressed:(UIButton *)sender;
- (IBAction)resetButtonPressed:(UIButton *)sender;



@end
