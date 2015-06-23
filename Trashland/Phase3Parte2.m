//
//  Phase3Parte2.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/18/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Phase3Parte2.h"
#import "DraggableView.h"
#import "PhasesChoose.h"
#import "PopUpViewController.h"

@interface Phase3Parte2 ()

@end

@implementation Phase3Parte2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewCarro1.podeY = YES;
    _viewCarro2.podeY = YES;
    
    [self checkWayFree];
    if (self.player.medalha1fase3) {
        self.badgeIdoso.image = [UIImage imageNamed:@"badge-idoso-color"];
    }
    if (self.player.medalha2fase3) {
        self.badgeTransito.image = [UIImage imageNamed:@"badge-transito-color"];
    }
    
    [self.fundo addSubview:self.botaoSom];
    [self.fundo addSubview:self.botaoVoltar];
    [self.fundo addSubview:self.badgeIdoso];
    [self.fundo addSubview:self.badgeTransito];
    
    self.ambulancia.image = [UIImage animatedImageNamed:@"ambulancia-" duration:1.f];
    [self.fundo addSubview:self.ambulancia];
}

-(void)checkWayFree{
    if (self.viewCarro1.center.y < 240) {
        self.viewCarro1.podeY = false;
    }
    if (self.viewCarro2.center.y > 540) {
        self.viewCarro2.podeY = false;
    }
    if (self.viewCarro1.center.y < 260 && self.viewCarro2.center.y > 540) {
        PopUpViewController *popUp = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpVC"];
        [popUp setImageNamed: @"pop-up-transito"];
        popUp.badgeImageView.image = [UIImage imageNamed:@"pop-up-transito"];
        self.popUpView = popUp;
        [popUp showInView:self.view animated:YES];
         [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(escolhaDeFases) userInfo:nil repeats:NO];
        
        [UIView animateWithDuration:4 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                self.ambulancia.frame = CGRectMake(1200, self.ambulancia.frame.origin.y, self.ambulancia.frame.size.width, self.ambulancia.frame.size.height); } completion:nil];
    }
    else{
        [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(checkWayFree) userInfo:nil repeats:NO];
    }
}

-(void)escolhaDeFases{
                PhasesChoose *game = [self.storyboard instantiateViewControllerWithIdentifier:@"PhasesChooseVC"];
            [game setModalPresentationStyle:UIModalPresentationFullScreen];
            self.player.medalha2fase3 = true;
    
            game.player = self.player;
            [self presentViewController:game animated:YES completion:nil];
}

@end
