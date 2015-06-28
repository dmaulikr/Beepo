//
//  Phase4.m
//  Trashland
//
//  Created by Thiago Borges Jordani on 25/06/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Phase4.h"
#import "Votacao.h"

@interface Phase4 ()

@end

@implementation Phase4


-(void)dealloc{
    NSLog(@"desalocou phase4");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.phase4ScrollView.contentSize = self.phase4ContentView.frame.size;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
