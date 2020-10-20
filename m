Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E95F629416D
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Oct 2020 19:26:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603214794;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=O4g4gm1kiw7/xzSUvvzN/XdvyOvhKW3mhCu+Onmshtg=;
	b=CEAgaHxh+Z4bZFHAq5p1U6p57mXTlLjc/9LBQREhUSjJ6ONGbT7p0WOSnbKdS9tcCL5JfM
	vNPetlmHrkQYdM9zIG/IBollKQablyK7N8kvvsI5rTxhNhzecX/LImLWpJCR3k2cbyRs0W
	hzpqNCJJtQfgxiMD2s8IpQFvZM9ntn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-BLw5Jz8wNSOmlT82I_25MA-1; Tue, 20 Oct 2020 13:26:32 -0400
X-MC-Unique: BLw5Jz8wNSOmlT82I_25MA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EB46425F6;
	Tue, 20 Oct 2020 17:26:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 601E92639C;
	Tue, 20 Oct 2020 17:26:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F31C181A869;
	Tue, 20 Oct 2020 17:26:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09KHQBTv012919 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 20 Oct 2020 13:26:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 07FCE6EF6B; Tue, 20 Oct 2020 17:26:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.138] (unknown [10.33.36.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ECC606EF50;
	Tue, 20 Oct 2020 17:26:05 +0000 (UTC)
To: Ken Gaillot <kgaillot@redhat.com>
References: <42f7ee78b48fe4c330095ddd50da117d2ac4a8ba.camel@redhat.com>
	<36e96321-1c6a-30a9-f388-3b4168e35ef6@alteeve.ca>
	<d9a5ffd2-1a84-1fb9-a9d6-a4880906acf1@fabbione.net>
	<7225ea25aa09badc6a57045b5b693bcd33a7e11b.camel@redhat.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <56578d13-39b1-3a16-62fb-1d909a8f7763@redhat.com>
Date: Tue, 20 Oct 2020 18:26:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <7225ea25aa09badc6a57045b5b693bcd33a7e11b.camel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, developers@clusterlabs.org,
	"Fabio M. Di Nitto" <fabbione@fabbione.net>
Subject: Re: [Cluster-devel] [ClusterLabs Developers] Pacemaker 2.1.0:
 Should we rename the master branch?
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

[CC+ cluster-devel]

On 19/10/2020 23:59, Ken Gaillot wrote:
> On Mon, 2020-10-19 at 07:19 +0200, Fabio M. Di Nitto wrote:
>> Hi Ken,
>>
>> On 10/2/2020 8:02 PM, Digimer wrote:
>>> On 2020-10-02 1:12 p.m., Ken Gaillot wrote:
>>>> Hi all,
>>>>
>>>> I sent a message to the users@clusterlabs.org list about
>>>> releasing
>>>> Pacemaker 2.1.0 next year.
>>>>
>>>> Coincidentally, there is a plan in the git and Github communities
>>>> to
>>>> change the default git branch from "master" to "main":
>>>>
>>>>    https://github.com/github/renaming
>>>>
>>>> The rationale for the change is not the specific meaning as used
>>>> in
>>>> branching, but rather to avoid any possibility of fostering an
>>>> exclusionary environment, and to replace generic metaphors with
>>>> something more obvious (especially to non-native English
>>>> speakers).
>>
>> No objections to the change, but please let´s coordinate the change
>> across all HA projects at once, or CI is going to break badly as the
>> concept of master branch is embedded everywhere and not per-project.
> 
> Presumably this would be all the projects built by jenkins?
> 
>   booth
>   corosync
>   fence-agents
>   fence-virt
>   knet
>   libqb
>   pacemaker
>   pcs
>   qdevice
>   resource-agents
>   sbd
> 
> Maintainers, do you think that's practical and desirable?

If the ClusterLabs projects switch together I might take the opportunity 
to make the switch in gfs2-utils.git at the same time, for consistency.

> Is there a single name that makes sense for all projects? "next",
> "development" or "unstable" captures how pacemaker uses master, not
> sure about other projects. "main" is generic enough for all projects,
> but so generic it doesn't give an idea of how it's used. Or we could go
> for something distinctive like fedora's "rawhide" or suse's
> "tumbleweed".

"main" works for me, it seems to be the most widely adopted alternative 
thanks to Github, so its purpose will be clear by convention. That said, 
it doesn't matter too much as long as the remote HEAD is set to the new 
branch.

Another question is how to do the switch without causing confusion the 
next time someone pulls. It might be safest to simply create the main 
branch and delete the master branch (rather than, say, replacing all of 
the content in master with an explanatory note). That way a 'git pull' 
gives a hint of the change and no messy conflicts:

   $ git pull
   From /tmp/gittest/upstream
    * [new branch]      main       -> origin/main
   Your configuration specifies to merge with the ref 'refs/heads/master'
   from the remote, but no such ref was fetched.

Maybe also push a 'master_is_now_main' tag annotated with 'use git 
branch -u origin/main to fix tracking branches'. Or maybe that's 
excessive :)

Cheers,
Andy

>> Since we are admin of all repositories, we can do it in one shot
>> without
>> too much pain and suffering in CI. It will require probably a day or
>> two
>> of CI downtime to rebuild the world as well.
>>
>> Fabio
>>
>>>>
>>>> The change would not affect existing repositories/projects.
>>>> However I
>>>> am wondering if we should take the opportunity of the minor-
>>>> version
>>>> bump to do the same for Pacemaker. The impact on developers would
>>>> be a
>>>> one-time process for each checkout/fork:
>>>>
>>>>    
>>>> https://wiki.clusterlabs.org/wiki/Pacemaker_2.1_Changes#Development_changes
>>>>
>>>> In my opinion, this is a minor usage that many existing projects
>>>> will
>>>> not bother changing, but I do think that since all new projects
>>>> will
>>>> default to "main", sometime in the future any project still using
>>>> "master" will appear outdated to young developers.
>>>>
>>>> We could use "main" or something else. Some projects are
>>>> switching to
>>>> names like "release", "stable", or "next" depending on how
>>>> they're
>>>> actually using the branch ("next" would be appropriate in
>>>> Pacemaker's
>>>> case).
>>>>
>>>> This will probably go on for years, so I am fine with either
>>>> changing
>>>> it with 2.1.0 (since it has bigger changes than usual, and we can
>>>> get
>>>> ahead of the curve) or waiting until the dust settles and future
>>>> conventions are clearer.
>>>>
>>>> Opinions?
>>>
>>> I support this change whole heatedly. I'll leave it to others to
>>> decide
>>> what new word is best (though 'main' makes sense to me), but the
>>> goal of
>>> moving away from 'master/slave' is well worthwhile and appreciated.

