//
//  Phase2.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/15/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Phase2.h"

@interface Phase2(){
    UIDynamicAnimator* _animator;
    UIGravityBehavior* _gravity;
    UICollisionBehavior* _collision;

}
@property (weak, nonatomic) IBOutlet UIView *auxView;


@end

@implementation Phase2



-(void)viewDidLoad{
    [super viewDidLoad];
    _phaseScrollView.contentSize = CGSizeMake(_phaseBG.frame.size.width, _phaseBG.frame.size.height);
    
    
    [self prepareForMovement];
    [self dealWithMovement];
    
}


#pragma mark - Gavidade e Colisões
- (void)prepareForMovement{
    self.garrafaPet1.delegate = self;
    self.garrafaPet2.delegate = self;
    self.garrafaVidro.delegate = self;
    self.lata.delegate = self;
    self.papel.delegate = self;
    //    self.cascaBanana.delegate = self;
}

- (void)dealWithMovement{
    [_collision removeAllBoundaries];
    [_animator removeAllBehaviors];
    
    //UIDynamics
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.auxView];
    _gravity = [[UIGravityBehavior alloc] initWithItems:@[self.garrafaPet1, self.garrafaPet2, self.garrafaVidro, self.lata, self.papel, self.cascaBanana]];
    [_animator addBehavior:_gravity];
    
    _collision = [[UICollisionBehavior alloc] initWithItems:@[self.garrafaPet1, self.garrafaPet2, self.garrafaVidro, self.lata, self.papel, self.cascaBanana]];
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior:_collision];
    
}


#pragma mark - Tree Buttons
- (IBAction)didClickTree1:(UIButton *)sender {
    
    _arvore1.image = [UIImage imageNamed:@"parque-03"];
    float yInicial = _arvore1.frame.origin.y;
    float hInicial = _arvore1.frame.size.height;
    float yFinal = yInicial - (1070/2 - hInicial);
    float xInicial = _arvore1.frame.origin.x;
    float wInicial = _arvore1.frame.size.width;
    float xFinal = xInicial - (888/2 - wInicial)/2;
    _arvore1.frame = CGRectMake(xFinal-9, yFinal, 888/2
                                , 1070/2);
    sender.userInteractionEnabled = NO;
    
}
- (IBAction)didClickTree2:(UIButton *)sender {
    _arvore2.image = [UIImage imageNamed:@"parque-04"];
    float yInicial = _arvore2.frame.origin.y;
    float hInicial = _arvore2.frame.size.height;
    float yFinal = yInicial - (1298/2 - hInicial);
    float xInicial = _arvore2.frame.origin.x;
    float wInicial = _arvore2.frame.size.width;
    float xFinal = xInicial - (1064/2 - wInicial)/2;
    _arvore2.frame = CGRectMake(xFinal-9, yFinal, 1064/2
                                , 1298/2);
    sender.userInteractionEnabled = NO;
}
- (IBAction)didClickTree3:(UIButton *)sender {
    _arvore3.image = [UIImage imageNamed:@"parque-05"];
    float yInicial = _arvore3.frame.origin.y;
    float hInicial = _arvore3.frame.size.height;
    float yFinal = yInicial - (1300/2 - hInicial);
    float xInicial = _arvore3.frame.origin.x;
    float wInicial = _arvore3.frame.size.width;
    float xFinal = xInicial - (1080/2 - wInicial)/2;
    _arvore3.frame = CGRectMake(xFinal-11, yFinal, 1080/2
                                , 1300/2);
    sender.userInteractionEnabled = NO;
}
- (IBAction)didClickTree4:(UIButton *)sender {
    _arvore4.image = [UIImage imageNamed:@"parque-06"];
    float yInicial = _arvore4.frame.origin.y;
    float hInicial = _arvore4.frame.size.height;
    float yFinal = yInicial - (1068/2 - hInicial);
    float xInicial = _arvore4.frame.origin.x;
    float wInicial = _arvore4.frame.size.width;
    float xFinal = xInicial - (874/2 - wInicial)/2;
    _arvore4.frame = CGRectMake(xFinal-8, yFinal, 874/2
                                , 1068/2);
    sender.userInteractionEnabled = NO;
}
- (IBAction)didClickTree5:(UIButton *)sender {
    _arvore5.image = [UIImage imageNamed:@"parque-07"];
    float yInicial = _arvore5.frame.origin.y;
    float hInicial = _arvore5.frame.size.height;
    float yFinal = yInicial - (1298/2 - hInicial);
    float xInicial = _arvore5.frame.origin.x;
    float wInicial = _arvore5.frame.size.width;
    float xFinal = xInicial - (1064/2 - wInicial)/2;
    _arvore5.frame = CGRectMake(xFinal-9, yFinal, 1064/2
                                , 1298/2);
    sender.userInteractionEnabled = NO;
}
@end
