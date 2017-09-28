//
//  HHVideoController.m
//  mj_videoLaunch
//
//  Created by maoziyue on 2017/9/28.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "HHVideoController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>

#import "HHTabBarController.h"

@interface HHVideoController ()

@property (strong, nonatomic) MPMoviePlayerController *player;

@end

@implementation HHVideoController


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupVideoPlayer];
    
}

- (void)setupVideoPlayer
{
    self.player = [[MPMoviePlayerController alloc] initWithContentURL:_movieURL];
    
    [self.view addSubview:self.player.view];
    
    self.player.shouldAutoplay = YES;
    
    [self.player setControlStyle:MPMovieControlStyleNone];
    
    self.player.repeatMode = MPMovieRepeatModeOne;
    
    [self.player.view setFrame:[UIScreen mainScreen].bounds];
    
    self.player.view.alpha = 0;
    
    [UIView animateWithDuration:3 animations:^{
        self.player.view.alpha = 1;
        [self.player prepareToPlay];
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackStateChanged) name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
    
    [self setupLoginView];
}

- (void)setupLoginView
{
    //进入按钮
    UIButton *enterMainButton = [[UIButton alloc] init];
    enterMainButton.frame = CGRectMake(24, [UIScreen mainScreen].bounds.size.height - 32 - 48, [UIScreen mainScreen].bounds.size.width - 48, 48);
    enterMainButton.layer.borderWidth = 1;
    enterMainButton.layer.cornerRadius = 24;
    enterMainButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [enterMainButton setTitle:@"进入应用" forState:UIControlStateNormal];
    enterMainButton.alpha = 0;
    [self.player.view addSubview:enterMainButton];
    [enterMainButton addTarget:self action:@selector(enterMainAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [UIView animateWithDuration:3.0 animations:^{
        enterMainButton.alpha = 1.0;
    }];
}



#pragma mark - NSNotificationCenter
- (void)playbackStateChanged
{
    MPMoviePlaybackState playbackState = [self.player playbackState];
    
    if (playbackState == MPMoviePlaybackStateStopped || playbackState == MPMoviePlaybackStatePaused)
    {
        [self.player play];
    }
}


- (void)enterMainAction:(UIButton *)btn
{
    NSLog(@"进入应用");
    HHTabBarController *rootTabCtrl = [[HHTabBarController alloc]init];
    self.view.window.rootViewController = rootTabCtrl;
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    NSLog(@"-----video释放-----");
}


@end















