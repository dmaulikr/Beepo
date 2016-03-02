#import "ThirdStoryViewController.h"
#import "ThirdPhaseViewController.h"
#import "MiscellaneousAudio.h"

@interface ThirdStoryViewController () <ThirdPhaseViewControllerDelegate>

@property (nonatomic, weak) NSString *path;
@property (nonatomic, weak) ThirdPhaseViewController *thirdPhaseViewController;

@end

@implementation ThirdStoryViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    _path = [NSString stringWithFormat:@"%@/7_pre-rua.mp3", [[NSBundle mainBundle] resourcePath]];
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipped:)];
    [self.view addGestureRecognizer:swipe];
}

-(void)didSwipped:(UISwipeGestureRecognizer *)swipeRecogniser{
    [self performSegueWithIdentifier:@"phase3Segue" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"phase3Segue"]) {
        _thirdPhaseViewController = segue.destinationViewController;
        _thirdPhaseViewController.delegate = self;
    }
}

-(IBAction)didTappedVoiceStoryButton:(id)sender{
    MiscellaneousAudio *miscAudio = [MiscellaneousAudio sharedManager];
    [miscAudio playSongFromPath:_path];
}

- (void) askedToDismissThirdPhase{
   [_thirdPhaseViewController dismissViewControllerAnimated:YES completion:^void{
       if ([_delegate respondsToSelector:@selector(askedToDismissThirdStory)]) {
           [_delegate askedToDismissThirdStory];
       }
   }];
}

@end
