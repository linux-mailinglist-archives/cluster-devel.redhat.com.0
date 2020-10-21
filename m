Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AB20529531C
	for <lists+cluster-devel@lfdr.de>; Wed, 21 Oct 2020 21:50:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603309800;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HSFnhqZQnNeSW3sCnHJF8m2pvlgYOXk5NpdrxT1iaDs=;
	b=FS9n5mmJYlo3puncKIA0IS6LYLCJ+jzBG/KIzfoIcT2PRn0y8iPr2hfZaeM1LdKF38Cssv
	2YA4g9zOUMJG1IOtKDAjKgZis9R9gthHfdP6931jp2Fe/WYy6I/d1nRv8N+DnsPCcjKvnU
	W4VEhGb+cs/rymwUqgXnI1unooWyC3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-cyCYdFQdNEyTxNUQUVG35g-1; Wed, 21 Oct 2020 15:49:58 -0400
X-MC-Unique: cyCYdFQdNEyTxNUQUVG35g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFDF61921FA2;
	Wed, 21 Oct 2020 19:49:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 309035D9DD;
	Wed, 21 Oct 2020 19:49:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8393B8C7DE;
	Wed, 21 Oct 2020 19:49:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09LHPXTL012350 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 21 Oct 2020 13:25:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1985D5C22B; Wed, 21 Oct 2020 17:25:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from ovpn-119-136.rdu2.redhat.com (ovpn-119-136.rdu2.redhat.com
	[10.10.119.136])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5BE8E5C225;
	Wed, 21 Oct 2020 17:25:26 +0000 (UTC)
Message-ID: <e91f6846a2280ed80462f38eac57732ba065bbdd.camel@redhat.com>
From: Ken Gaillot <kgaillot@redhat.com>
To: "Fabio M. Di Nitto" <fabbione@fabbione.net>, Andrew Price
	<anprice@redhat.com>
Date: Wed, 21 Oct 2020 12:25:26 -0500
In-Reply-To: <d1bf4f1f-7a33-b8c5-a04d-769a34b9d8d7@fabbione.net>
References: <42f7ee78b48fe4c330095ddd50da117d2ac4a8ba.camel@redhat.com>
	<36e96321-1c6a-30a9-f388-3b4168e35ef6@alteeve.ca>
	<d9a5ffd2-1a84-1fb9-a9d6-a4880906acf1@fabbione.net>
	<7225ea25aa09badc6a57045b5b693bcd33a7e11b.camel@redhat.com>
	<56578d13-39b1-3a16-62fb-1d909a8f7763@redhat.com>
	<d1bf4f1f-7a33-b8c5-a04d-769a34b9d8d7@fabbione.net>
Organization: Red Hat
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Wed, 21 Oct 2020 15:49:45 -0400
Cc: cluster-devel <cluster-devel@redhat.com>, developers@clusterlabs.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Maybe we should wait until github finishes putting its plans in place.
Especially if we want to do all projects at once, there's no need to
tie it to a particular Pacemaker release.

On Wed, 2020-10-21 at 06:10 +0200, Fabio M. Di Nitto wrote:
> 
> On 10/20/2020 7:26 PM, Andrew Price wrote:
> > [CC+ cluster-devel]
> > 
> > On 19/10/2020 23:59, Ken Gaillot wrote:
> > > On Mon, 2020-10-19 at 07:19 +0200, Fabio M. Di Nitto wrote:
> > > > Hi Ken,
> > > > 
> > > > On 10/2/2020 8:02 PM, Digimer wrote:
> > > > > On 2020-10-02 1:12 p.m., Ken Gaillot wrote:
> > > > > > Hi all,
> > > > > > 
> > > > > > I sent a message to the users@clusterlabs.org list about
> > > > > > releasing
> > > > > > Pacemaker 2.1.0 next year.
> > > > > > 
> > > > > > Coincidentally, there is a plan in the git and Github
> > > > > > communities
> > > > > > to
> > > > > > change the default git branch from "master" to "main":
> > > > > > 
> > > > > >    https://github.com/github/renaming
> > > > > > 
> > > > > > The rationale for the change is not the specific meaning as
> > > > > > used
> > > > > > in
> > > > > > branching, but rather to avoid any possibility of fostering
> > > > > > an
> > > > > > exclusionary environment, and to replace generic metaphors
> > > > > > with
> > > > > > something more obvious (especially to non-native English
> > > > > > speakers).
> > > > 
> > > > No objections to the change, but please let´s coordinate the
> > > > change
> > > > across all HA projects at once, or CI is going to break badly
> > > > as the
> > > > concept of master branch is embedded everywhere and not per-
> > > > project.
> > > 
> > > Presumably this would be all the projects built by jenkins?
> 
> correct.
> 
> > > 
> > >   booth
> > >   corosync
> > >   fence-agents
> > >   fence-virt
> > >   knet
> > >   libqb
> > >   pacemaker
> > >   pcs
> > >   qdevice
> > >   resource-agents
> > >   sbd
> > > 
> > > Maintainers, do you think that's practical and desirable?
> 
> I think I have super powers all repos to do the switch when github
> is 
> ready to make us the switch. Practical no, there will be
> disruptions... 
> desirable no, it´s extra work, but the point is that it is doable.
> 
> > 
> > If the ClusterLabs projects switch together I might take the
> > opportunity 
> > to make the switch in gfs2-utils.git at the same time, for
> > consistency.
> > 
> > > Is there a single name that makes sense for all projects? "next",
> > > "development" or "unstable" captures how pacemaker uses master,
> > > not
> > > sure about other projects. "main" is generic enough for all
> > > projects,
> > > but so generic it doesn't give an idea of how it's used. Or we
> > > could go
> > > for something distinctive like fedora's "rawhide" or suse's
> > > "tumbleweed".
> > 
> > "main" works for me, it seems to be the most widely adopted
> > alternative 
> > thanks to Github, so its purpose will be clear by convention. That
> > said, 
> > it doesn't matter too much as long as the remote HEAD is set to the
> > new 
> > branch.
> 
> I would go for main and follow github recommendations. They are
> putting 
> automatic redirects in place to smooth the transition and we can
> avoid 
> spending time finding a name that won´t offend some delicate soul
> over 
> the internet.
> 
> > 
> > Another question is how to do the switch without causing confusion
> > the 
> > next time someone pulls. It might be safest to simply create the
> > main 
> > branch and delete the master branch (rather than, say, replacing
> > all of 
> > the content in master with an explanatory note). That way a 'git
> > pull' 
> > gives a hint of the change and no messy conflicts:
> > 
> >    $ git pull
> >    From /tmp/gittest/upstream
> >     * [new branch]      main       -> origin/main
> >    Your configuration specifies to merge with the ref
> > 'refs/heads/master'
> >    from the remote, but no such ref was fetched.
> > 
> > Maybe also push a 'master_is_now_main' tag annotated with 'use git 
> > branch -u origin/main to fix tracking branches'. Or maybe that's 
> > excessive :)
> 
> Let´s wait for github to put those in place for us. No point to 
> re-invent the wheel. Last blog I read they were working to do it at 
> infrastructure level and that would save us a lot of headaches and 
> complications.
> 
> IIRC they will add main branch automatically to new projects and 
> transition old ones. the master branch will be an automatic redirect
> to 
> main. Basically will solve 99% of our issues. git pull won´t break
> etc.
> 
> Cheers
> Fabio
> 
> > 
> > Cheers,
> > Andy
> > 
> > > > Since we are admin of all repositories, we can do it in one
> > > > shot
> > > > without
> > > > too much pain and suffering in CI. It will require probably a
> > > > day or
> > > > two
> > > > of CI downtime to rebuild the world as well.
> > > > 
> > > > Fabio
> > > > 
> > > > > > 
> > > > > > The change would not affect existing repositories/projects.
> > > > > > However I
> > > > > > am wondering if we should take the opportunity of the
> > > > > > minor-
> > > > > > version
> > > > > > bump to do the same for Pacemaker. The impact on developers
> > > > > > would
> > > > > > be a
> > > > > > one-time process for each checkout/fork:
> > > > > > 
> > > > > > https://wiki.clusterlabs.org/wiki/Pacemaker_2.1_Changes#Development_changes 
> > > > > > 
> > > > > > 
> > > > > > In my opinion, this is a minor usage that many existing
> > > > > > projects
> > > > > > will
> > > > > > not bother changing, but I do think that since all new
> > > > > > projects
> > > > > > will
> > > > > > default to "main", sometime in the future any project still
> > > > > > using
> > > > > > "master" will appear outdated to young developers.
> > > > > > 
> > > > > > We could use "main" or something else. Some projects are
> > > > > > switching to
> > > > > > names like "release", "stable", or "next" depending on how
> > > > > > they're
> > > > > > actually using the branch ("next" would be appropriate in
> > > > > > Pacemaker's
> > > > > > case).
> > > > > > 
> > > > > > This will probably go on for years, so I am fine with
> > > > > > either
> > > > > > changing
> > > > > > it with 2.1.0 (since it has bigger changes than usual, and
> > > > > > we can
> > > > > > get
> > > > > > ahead of the curve) or waiting until the dust settles and
> > > > > > future
> > > > > > conventions are clearer.
> > > > > > 
> > > > > > Opinions?
> > > > > 
> > > > > I support this change whole heatedly. I'll leave it to others
> > > > > to
> > > > > decide
> > > > > what new word is best (though 'main' makes sense to me), but
> > > > > the
> > > > > goal of
> > > > > moving away from 'master/slave' is well worthwhile and
> > > > > appreciated.
> 
> 
-- 
Ken Gaillot <kgaillot@redhat.com>

