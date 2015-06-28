//
//  Phase4.m
//  Trashland
//
//  Created by Thiago Borges Jordani on 25/06/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Phase4.h"
#import "Votacao.h"
#import "Puzzle4.h"
#import <AVFoundation/AVFoundation.h>

@interface Phase4 ()

@end

@implementation Phase4
AVAudioPlayer* _audioPlayer12;
NSString* path11;

-(void)dealloc{
    NSLog(@"desalocou phase4");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    path11 = [NSString stringWithFormat:@"%@/11_prefeitura.mp3", [[NSBundle mainBundle] resourcePath]];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didClickUrna:(id)sender {
    Votacao *game = [self.storyboard instantiateViewControllerWithIdentifier:@"VotacaoVC"];
    [game setModalPresentationStyle:UIModalPresentationFullScreen];
    game.player = self.player;
    [self presentViewController:game animated:NO completion:nil];
}

- (IBAction)didClickBox:(id)sender {
    Puzzle4 *game = [self.storyboard instantiateViewControllerWithIdentifier:@"Puzzle4VC"];
    [game setModalPresentationStyle:UIModalPresentationFullScreen];
    game.player = self.player;
    [self presentViewController:game animated:NO completion:nil];
}
- (IBAction)voltarBtnClicked:(id)sender {
    [self.player dismissToPhaseSelect];
}

-(IBAction)falaQueEuTeEstupro:(id)sender{
    NSURL *soundUrl = [NSURL fileURLWithPath:path11];
    
    // Create audio player object and initialize with URL to sound
    _audioPlayer12 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [_audioPlayer12 play];
}
@end
