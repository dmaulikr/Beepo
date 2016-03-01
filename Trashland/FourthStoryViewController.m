#import "FourthStoryViewController.h"
#import "FourthPhaseViewController.h"

@interface FourthStoryViewController (){
    NSString* path8;
}

@property (nonatomic) IBOutlet UIImageView* fundo;

@end

@implementation FourthStoryViewController


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
        FourthPhaseViewController*game = [self.storyboard instantiateViewControllerWithIdentifier:@"Phase4VC"];
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
