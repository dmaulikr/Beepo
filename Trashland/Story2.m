//
//  Story2.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/15/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Story2.h"
#import "Phase2.h"

@implementation Story2


-(void)viewDidLoad{
    [super viewDidLoad];
    [self moveBeepo:self.moveBeepoView];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
}

-(void)swipe:(UISwipeGestureRecognizer *)swipeRecogniser{
    Phase2 *game = [self.storyboard instantiateViewControllerWithIdentifier:@"Phase2VC"];
    [game setModalPresentationStyle:UIModalPresentationFullScreen];
    game.player = self.player;
    [self presentViewController:game animated:YES completion:nil];
}

- (void)moveBeepo:(UIView *)imageView{
    [UIView animateWithDuration:4 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        imageView.frame = CGRectMake(337.f, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height); } completion:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    CGRect charFrame = self.imgFantasminha.frame;
    charFrame.origin.y = charFrame.origin.y - 25.0;
    charFrame.size.height = charFrame.size.height + 15.0;
    
    CGRect shadowFrame = self.imgSombra.frame;
    shadowFrame.size.width = shadowFrame.size.width/2.0;
    shadowFrame.origin.x = shadowFrame.origin.x + shadowFrame.size.width/2;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.6];//0.05
    [UIView setAnimationDelay:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatCount:NSUIntegerMax];
    [UIView setAnimationRepeatAutoreverses:YES];
    
    self.imgFantasminha.frame = charFrame;
    self.imgSombra.frame = shadowFrame;
    
    
    [UIView commitAnimations];
}

@end
