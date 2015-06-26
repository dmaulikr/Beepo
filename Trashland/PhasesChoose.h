//
//  PhasesChoose.h
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/15/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Player.h"

@class Player;

@interface PhasesChoose : UIViewController

@property (nonatomic) IBOutlet UIImageView* fundo;

@property (nonatomic) IBOutlet UIButton* fase1;
@property (nonatomic) IBOutlet UIImageView* medalha1fase1;
@property (nonatomic) IBOutlet UIImageView* medalha2fase1;

@property (nonatomic) IBOutlet UIButton* fase2;
@property (nonatomic) IBOutlet UIImageView* medalha1fase2;
@property (nonatomic) IBOutlet UIImageView* medalha2fase2;

@property (nonatomic) IBOutlet UIButton* fase3;
@property (nonatomic) IBOutlet UIImageView* medalha1fase3;
@property (nonatomic) IBOutlet UIImageView* medalha2fase3;

@property (nonatomic) IBOutlet UIButton* fase4;
@property (nonatomic) IBOutlet UIImageView* medalha1fase4;
@property (nonatomic) IBOutlet UIImageView* medalha2fase4;

@property (nonatomic) IBOutlet UIButton* backButton;
@property (nonatomic) IBOutlet UIButton* playSoundButton;
@property (nonatomic) IBOutlet UIButton* infoButton;

@property (nonatomic) IBOutlet UILabel* labelCasa;
@property (nonatomic) IBOutlet UILabel* labelParque;
@property (nonatomic) IBOutlet UILabel* labelHospital;
@property (nonatomic) IBOutlet UILabel* labelPrefeitura;

@property (strong, nonatomic) Player* player;

@end
