//
//  TPI_TwitchPlaysPokemon.m
//  twitchplayerspokemon
//
//  Created by Jonathan Dahan on 2/20/14.
//  Copyright (c) 2014 Jonathan Dahan. All rights reserved.
//

#import "TPI_TwitchPlaysPokemon.h"

@implementation TPI_TwitchPlaysPokemon

- (IRCMessage *)interceptServerInput:(IRCMessage *)input
                                 for:(IRCClient *)client
{
    /* Only handle regular messages. */
    if ([input.command isEqualToString:IRCPrivateCommandIndex("privmsg")] == NO) {
        return input;
    }

    /* How IRCMessage is designed, the actual message of PRIVMSG should be the
     second index of our input params. Let's hope a future version of Textual
     does not break that. If it does, then we are screwed here. */
    NSString *message = [input.params safeObjectAtIndex:1];

    if([message isEqual:@"up"]
       || [message isEqual:@"down"]
       || [message isEqual:@"left"]
       || [message isEqual:@"right"]
       || [message isEqual:@"a"]
       || [message isEqual:@"A"]
       || [message isEqual:@"b"]
       || [message isEqual:@"B"]
       || [message isEqual:@"anarchy"]
       || [message isEqual:@"democracy"]
       || [message isEqual:@"Democracy"]
       || [message isEqual:@"start"]
       || [message isEqual:@"select"]){
        return nil;
    }

    return input;
}

@end