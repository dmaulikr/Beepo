//
//  ViewController.m
//  Trashland
//
//  Created by Thiago Borges Jordani on 10/06/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Start.h"
#import <AudioToolbox/AudioToolbox.h>
#import "Player.h"
#import "PhasesChoose.h"
#import "AppDelegate.h"

@interface Start ()
@end

@implementation Start
SystemSoundID sound2;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self moveClouds: _cloud1];
    [self moveClouds: _cloud2];
    [self moveClouds: _cloud3];
    
    [self.view addSubview:self.fundo];
    [self.fundo addSubview:self.logo];
    [self.fundo addSubview:self.predios];
    [self.fundo addSubview:self.cloud1];
    [self.fundo addSubview:self.cloud2];
    [self.fundo addSubview:self.cloud3];
    [self.fundo addSubview:self.playImage];
    
    
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"hackbeatwav" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound2);
    AudioServicesPlaySystemSound(sound2);
    
    
    [NSTimer scheduledTimerWithTimeInterval:2.5f target:self selector:@selector(trocarPredio) userInfo:nil repeats:NO];
    
}

- (void)moveClouds:(UIImageView *)imageView{
    [UIView animateWithDuration:20.0f delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        imageView.frame = CGRectMake(-self.view.frame.size.width + 100.0, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height); } completion:nil];
}

- (IBAction)start:(id)sender{
    PhasesChoose *game = [self.storyboard instantiateViewControllerWithIdentifier:@"PhasesChooseVC"];
    [game setModalPresentationStyle:UIModalPresentationFullScreen];
    Player* player = [[Player alloc] init];
    
    player.fase1 = true;
    player.fase2 = false;
    player.fase3 = false;
    player.fase4 = false;
    
    player.medalha1fase1 = false;
    player.medalha2fase1 = false;
    
    player.medalha1fase2 = false;
    player.medalha2fase2 = false;
    
    player.medalha1fase3 = false;
    player.medalha2fase3 = false;
    
    player.medalha1fase4 = false;
    player.medalha2fase4 = false;
    
    game.player = player;
    [self presentViewController:game animated:YES completion:nil];
}

-(void)trocarPredio{
    self.predios.image = [UIImage imageNamed:@"predio2"];
        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(trocarDeNovo) userInfo:nil repeats:NO];
}

-(void)trocarDeNovo{
    self.predios.image = [UIImage imageNamed:@"predio"];
        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(trocarPredio) userInfo:nil repeats:NO];
}

@end
