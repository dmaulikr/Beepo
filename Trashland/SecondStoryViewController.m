#import "SecondStoryViewController.h"
#import "SecondPhaseViewController.h"
#import "MiscellaneousAudio.h"

@interface SecondStoryViewController () <SecondPhaseViewControllerDelegate>

@property (nonatomic) CGRect ghostStarterFrame;
@property (nonatomic) CGRect shadowStarterFrame;
@property (weak, nonatomic) IBOutlet UIImageView *imgFantasminha;
@property (weak, nonatomic) IBOutlet UIImageView *imgSombra;
@property (weak, nonatomic) IBOutlet UIView *moveBeepoView;
@property (strong, nonatomic) NSString *path;

@property (weak, nonatomic) SecondPhaseViewController *secondPhaseViewController;

@end

@implementation SecondStoryViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    _path = [NSString stringWithFormat:@"%@/5_pre-parque.mp3", [[NSBundle mainBundle] resourcePath]];
    
    [self moveBeepo:self.moveBeepoView];
    _ghostStarterFrame = self.imgFantasminha.frame;
    _shadowStarterFrame = self.imgSombra.frame;
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipped:)];
    [self.view addGestureRecognizer:swipeLeft];
}

-(void)didSwipped:(UISwipeGestureRecognizer *)swipeRecogniser{
    [self performSegueWithIdentifier:@"phase2Segue" sender:self];
}

- (void)moveBeepo:(UIView *)imageView{
    [UIView animateWithDuration:4 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        imageView.frame = CGRectMake(337.f, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height); } completion:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.imgFantasminha.frame = _ghostStarterFrame;
    self.imgSombra.frame = _shadowStarterFrame;
    [super viewDidAppear:animated];
    CGRect charFrame = self.imgFantasminha.frame;
    charFrame.origin.y = charFrame.origin.y - 25.0;
    charFrame.size.height = charFrame.size.height + 15.0;
    
    CGRect shadowFrame = self.imgSombra.frame;
    shadowFrame.size.width = shadowFrame.size.width/2.0;
    shadowFrame.origin.x = shadowFrame.origin.x + shadowFrame.size.width/2;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.6];//0.05
    [UIView setAnimationDelay:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatCount:NSUIntegerMax];
    [UIView setAnimationRepeatAutoreverses:YES];
    
    self.imgFantasminha.frame = charFrame;
    self.imgSombra.frame = shadowFrame;
    [UIView commitAnimations];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"phase2Segue"]) {
        _secondPhaseViewController = segue.destinationViewController;
        _secondPhaseViewController.delegate = self;
    }
}

-(IBAction)didTappedVoiceStoryButton:(id)sender{
    MiscellaneousAudio *miscAudio = [MiscellaneousAudio sharedManager];
    [miscAudio playSongFromPath:_path];
}

- (void) askedToDismissSecondPhase{
    [_secondPhaseViewController dismissViewControllerAnimated:YES completion:^void{
        if ([_delegate respondsToSelector:@selector(askedToDismissSecondStory)]) {
            [_delegate askedToDismissSecondStory];
        }
    }];
}

@end
