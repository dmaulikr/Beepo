#import "HomeViewController.h"
#import "UIView+Animation2.h"
#import "BackgroundSong.h"
#import "InfoViewController.h"
#import "CustomizationViewController.h"

@interface HomeViewController () <InfoViewControllerDelegate, CustomizationViewControllerDelegate>

@property (nonatomic, weak) IBOutlet UIImageView* predios;
@property (nonatomic, weak) IBOutlet UIButton* play;

@property (nonatomic, weak) InfoViewController *infoViewController;
@property (nonatomic, weak) CustomizationViewController *customizationViewController;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //BackgroundSong *backgroundSong = [BackgroundSong sharedManager];
    //[backgroundSong playSongFromPath:[NSString stringWithFormat:@"%@/carefree.mp3", [[NSBundle mainBundle] resourcePath]]];
    
    [NSTimer scheduledTimerWithTimeInterval:1.8f target:self selector:@selector(balancarLogo) userInfo:nil repeats:YES];
    [self.play tada:NULL];
    
    [NSTimer scheduledTimerWithTimeInterval:1.5f target:self selector:@selector(trocarPredio) userInfo:nil repeats:YES];
}

- (IBAction)didTappedPlayButton:(id)sender{
    [self performSegueWithIdentifier:@"playSegue" sender:self];
}

- (IBAction)didTappedInfoButton:(id)sender{
    [self performSegueWithIdentifier:@"infoSegue" sender:self];
}

-(void)trocarPredio{
    self.predios.image = [self.predios.image isEqual:[UIImage imageNamed:@"predio2"]] ? [UIImage imageNamed:@"predio"] : [UIImage imageNamed:@"predio2"];
}

-(void)balancarLogo{
    [self.play pulse:NULL];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"infoSegue"]) {
        _infoViewController = segue.destinationViewController;
        _infoViewController.delegate = self;
    } else if ([segue.identifier isEqualToString:@"playSegue"]){
        _customizationViewController =  segue.destinationViewController;
        _customizationViewController.delegate = self;
    }
}

- (void) askedToDismissInfo{
    [_infoViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void) askedToDismissCustomization{
    [_customizationViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
