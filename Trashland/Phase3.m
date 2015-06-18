//
//  Phase3.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/15/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Phase3.h"

@interface Phase3()  <UICollisionBehaviorDelegate>

@end

@implementation Phase3
UIDynamicAnimator* _animator2;
UICollisionBehavior* _collision2;

-(void) viewDidLoad{
    [super viewDidLoad];
    self.viewVelha.userInteractionEnabled = YES;
    self.viewVelha.delegate = self;
    self.viewVelha.charImgView = self.imageVelha;
    [self moveBeepo:self.viewBeepo];
    [self moveCar1:self.carro1];
    [self moveCar2:self.carro2];
//    [self.view addSubview:self.fundo];
//    [self.fundo addSubview:self.viewBeepo];
//    [self.fundo addSubview:self.viewVelha];
//    [self.fundo addSubview:self.carro1];
//    [self.fundo addSubview:self.carro2];
    
    _animator2 = [[UIDynamicAnimator alloc] initWithReferenceView:[self.viewVelha superview]];
    _collision2 = [[UICollisionBehavior alloc] initWithItems:@[self.viewVelha]];
    _collision2.collisionDelegate = self;
    _collision2.translatesReferenceBoundsIntoBoundary = YES;
    [_animator2 addBehavior:_collision2];
    
    [self watchThisBitch];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
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
    
    
}

- (void)moveBeepo:(UIImageView *)imageView{
    [UIView animateWithDuration:4 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
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
        NSLog(@"PASSOY");
    }
    else{
        [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(watchThisBitch) userInfo:nil repeats:NO];
    }
}



@end
