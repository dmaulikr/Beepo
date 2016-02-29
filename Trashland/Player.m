#import "Player.h"

@implementation Player
-(void)dealloc{
    NSLog(@"desalocou player");
}
- (void)dismissToPhaseSelect{
    [self.telaEscolha dismissViewControllerAnimated:YES completion:nil];
}
@end
