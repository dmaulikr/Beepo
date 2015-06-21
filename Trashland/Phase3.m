//
//  Phase3.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/15/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Phase3.h"
#import "Phase3Parte2.h"
#import "PopUpViewController.h"

@interface Phase3()  <UICollisionBehaviorDelegate>

@end

@implementation Phase3
UIDynamicAnimator* _animator2;
UICollisionBehavior* _collision2;

-(void) viewDidLoad{
    [super viewDidLoad];
    [self checkBadges];

}

- (void)viewDidAppear:(BOOL)animated {
    
    
    [super viewDidAppear:animated];
    
    self.viewVelha.userInteractionEnabled = YES;
    self.viewVelha.delegate = self;
    self.viewVelha.charImgView = self.imageVelha;
    _viewVelha.podeY = YES;
    [self moveBeepo:self.viewBeepo];
    [self moveCar1:self.carro1];
    [self moveCar2:self.carro2];
    [self watchThisBitch];
    
    CGRect charFrame = self.imageBeepo.frame;
    charFrame.origin.y = charFrame.origin.y - 25.0;
    charFrame.size.height = charFrame.size.height + 15.0;
    
    CGRect shadowFrame = self.imageSombraBeepo.frame;
    shadowFrame.size.width = shadowFrame.size.width/2.0;
    shadowFrame.origin.x = shadowFrame.origin.x + shadowFrame.size.width/2;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.6];//0.05
    [UIView setAnimationDelay:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatCount:NSUIntegerMax];
    [UIView setAnimationRepeatAutoreverses:YES];
    
    self.imageBeepo.frame = charFrame;
    self.imageSombraBeepo.frame = shadowFrame;
    
    CGRect charFrame2 = self.imageVelha.frame;
    charFrame2.origin.y = charFrame2.origin.y - 25.0;
    charFrame2.size.height = charFrame2.size.height + 15.0;
    
    CGRect shadowFrame2 = self.imageSombraVelha.frame;
    shadowFrame2.size.width = shadowFrame2.size.width/2.0;
    shadowFrame2.origin.x = shadowFrame2.origin.x + shadowFrame2.size.width/2;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.8];//0.05
    [UIView setAnimationDelay:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatCount:NSUIntegerMax];
    [UIView setAnimationRepeatAutoreverses:YES];
    
    self.imageVelha.frame = charFrame2;
    self.imageSombraVelha.frame = shadowFrame2;

    [UIView commitAnimations];
    
    [self.fundo addSubview:self.botaoSom];
    [self.fundo addSubview:self.botaoVoltar];
    [self.fundo addSubview:self.badgeIdoso];
    [self.fundo addSubview:self.badgeTransito];
}

-(void)checkBadges{
    if (self.player.medalha2fase3) {
        self.badgeTransito.image = [UIImage imageNamed:@"badge-transito-color"];
        self.badgeIdoso.image = [UIImage imageNamed:@"badge-idoso-color"];
    }
    else if (self.player.medalha1fase3){
        self.badgeIdoso.image = [UIImage imageNamed:@"badge-idoso-color"];
    }
    else{
        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(checkBadges) userInfo:nil repeats:NO];
    }
}

- (void)moveBeepo:(UIImageView *)imageView{
    [UIView animateWithDuration:4 delay:0.0 options:UIViewAnimationCurveEaseOut animations:^{
        imageView.frame = CGRectMake(150.f, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height); } completion:nil];
}

- (void)moveCar1:(UIImageView *)imageView{
    [UIView animateWithDuration:4 delay:0.0 options:UIViewAnimationCurveEaseOut animations:^{
        imageView.frame = CGRectMake(543.f, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height); } completion:nil];
}

- (void)moveCar2:(UIImageView *)imageView{
    [UIView animateWithDuration:2 delay:0.0 options:UIViewAnimationCurveEaseOut animations:^{
        imageView.frame = CGRectMake(592.f, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height); } completion:nil];
}

-(void)watchThisBitch{
    if (self.viewVelha.center.y < 480) {
        PopUpViewController *popUp = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpVC"];
        [popUp setImageNamed: @"pop-up-idoso"];
        self.popUpView = popUp;
        [popUp showInView:self.view animated:YES];
        
        Phase3Parte2 *game = [self.storyboard instantiateViewControllerWithIdentifier:@"Phase3Parte2VC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
        self.player.medalha1fase3 = true;
        self.player.fase4 = true;
        game.player = self.player;
        [self presentViewController:game animated:NO completion:nil];
    }
    else{
        [NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(watchThisBitch) userInfo:nil repeats:NO];
    }
}

@end
