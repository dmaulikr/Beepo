#import "Story4.h"
#import "Phase4.h"

@interface Story4 (){
    NSString* path8;
}

@property (nonatomic) IBOutlet UIImageView* fundo;

@end

@implementation Story4


- (void)viewDidLoad {
    [super viewDidLoad];
    path8 = [NSString stringWithFormat:@"%@/10_pre-prefeitura.mp3", [[NSBundle mainBundle] resourcePath]];
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
}

-(void)swipe:(UISwipeGestureRecognizer *)swipeRecogniser{
    if ([swipeRecogniser direction] == UISwipeGestureRecognizerDirectionLeft){
        Phase4 *game = [self.storyboard instantiateViewControllerWithIdentifier:@"Phase4VC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
    //    game.player = self.player;
        [self presentViewController:game animated:NO completion:nil];
    }
}

-(IBAction)falaQueEuTeEstupro:(id)sender{
    NSURL *soundUrl = [NSURL fileURLWithPath:path8];
  //  _audioPlayer9 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
  //  [_audioPlayer9 play];
}
@end
