//
//  Story1.h
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/15/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface Story1 : UIViewController

@property (nonatomic) IBOutlet UIPageControl* controle;
@property (nonatomic) IBOutlet UIImageView* background;
@property (nonatomic) IBOutlet UIButton* botaoVoltar;
@property (nonatomic) IBOutlet UIButton* botaoPlay;
@property (nonatomic) Player* player;
@property (weak, nonatomic) IBOutlet UIImageView *gifDedo;

//Page 1
@property (nonatomic) IBOutlet UIView* viewGasper;
@property (nonatomic) IBOutlet UIImageView* sombra;
@property (nonatomic) IBOutlet UIImageView* gasper;
@property (nonatomic) IBOutlet UILabel* frase1;
@property (nonatomic) IBOutlet UILabel* frase2;

//Page 2
@property (nonatomic) IBOutlet UIImageView* interrogacao1;
@property (nonatomic) IBOutlet UIImageView* interrogacao2;
@property (nonatomic) IBOutlet UIImageView* interrogacao3;
@property (nonatomic) IBOutlet UILabel* frase3;
@property (nonatomic) IBOutlet UILabel* frase4;

//Page 3
@property (nonatomic) IBOutlet UIView* viewGasperTriste;
@property (nonatomic) IBOutlet UIImageView* gasperTriste;
@property (nonatomic) IBOutlet UIImageView* gaspersombraTriste;

@end
