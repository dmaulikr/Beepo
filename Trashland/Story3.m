#import "Story3.h"
#import "Phase3.h"

@interface Story3(){
    NSString* path5;
}

@property (nonatomic) IBOutlet UIImageView* fundo;

@end

@implementation Story3

-(void)viewDidLoad{
    [super viewDidLoad];
    
    path5 = [NSString stringWithFormat:@"%@/7_pre-rua.mp3", [[NSBundle mainBundle] resourcePath]];
    
//    [self.view addSubview:self.fundo];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];

}

-(void)swipe:(UISwipeGestureRecognizer *)swipeRecogniser{
    if ([swipeRecogniser direction] == UISwipeGestureRecognizerDirectionLeft)
    {
        Phase3 *game = [self.storyboard instantiateViewControllerWithIdentifier:@"Phase3VC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
      //  game.player = self.player;
        [self presentViewController:game animated:NO completion:nil];
    }
    else if ([swipeRecogniser direction] == UISwipeGestureRecognizerDirectionRight)
    {
       
    }
}
-(IBAction)falaQueEuTeEstupro:(id)sender{
    NSURL *soundUrl = [NSURL fileURLWithPath:path5];
    
    // Create audio player object and initialize with URL to sound
 //   _audioPlayer6 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
 //   [_audioPlayer6 play];
}

@end
