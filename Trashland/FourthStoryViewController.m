#import "FourthStoryViewController.h"
#import "FourthPhaseViewController.h"
#import "MiscellaneousAudio.h"

@interface FourthStoryViewController () <FourthPhaseViewControllerDelegate>

@property (nonatomic) IBOutlet UIImageView* fundo;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, weak) FourthPhaseViewController *fourthPhaseViewController;

@end

@implementation FourthStoryViewController


- (void)viewDidLoad {
    [super viewDidLoad];
   
    _path = [NSString stringWithFormat:@"%@/10_pre-prefeitura.mp3", [[NSBundle mainBundle] resourcePath]];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:swipeRight];
}

-(void)swipe:(UISwipeGestureRecognizer *)swipeRecogniser{
    [self performSegueWithIdentifier:@"phase4Segue" sender:self];
}

-(IBAction)didTappedVoiceStory:(id)sender{
    MiscellaneousAudio *miscAudio = [MiscellaneousAudio sharedManager];
    [miscAudio playSongFromPath:_path];
}

- (IBAction)didTappedBackButton:(id)sender{
    [self askedToDismiss];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"phase4Segue"]) {
        _fourthPhaseViewController = segue.destinationViewController;
        _fourthPhaseViewController.delegate = self;
    }
}

- (void) askedToDismiss{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
