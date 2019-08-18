Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 898079197E
	for <lists+cluster-devel@lfdr.de>; Sun, 18 Aug 2019 22:17:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC8B919CF92;
	Sun, 18 Aug 2019 20:17:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DD2C1E0;
	Sun, 18 Aug 2019 20:17:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B054218005B9;
	Sun, 18 Aug 2019 20:17:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7IKHNnk005875 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 18 Aug 2019 16:17:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 21BE41CC; Sun, 18 Aug 2019 20:17:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C86F05D717;
	Sun, 18 Aug 2019 20:17:20 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E10C317529B;
	Sun, 18 Aug 2019 20:17:18 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id t6so16431009ios.7;
	Sun, 18 Aug 2019 13:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BNISD0jbBrhgxwSGll6SKBIMRJhUTsI0mcKzXG+2Cc8=;
	b=iVpCn1z/h2TF4mRwQPNkEisgatFJRWBal3DSkHLn1QVjcVUgekKqpFVSU2DCvxrlmT
	vGXTO0ol2HwdETUX1wm0qbKkeB0VIfvv8giDwxzi0jsC+kULBCy5QxaVmp+QGLKtxuQu
	/lkXZk47NBpXwQqrvTt3iOzzYYg3YFytrNxQA6OZaDU+h+r6Xod1blkv1WyM7KSPMzML
	3XiW9GXm8v3nDm6W2ydkdZp9wVE9sYCowMui+vQhfgonptPHoQxiVNsSNo68u6Oaz4wM
	D7Byzhg5G8LHUGf76KqEVABv+Ts7meyYVMTXtXJ+vPVR3PLKEcOeswrCFZ7HlQoyNbOa
	v2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BNISD0jbBrhgxwSGll6SKBIMRJhUTsI0mcKzXG+2Cc8=;
	b=CkzCHrAk8rAVSOcsW1uuihKC4YLPPj5Qovd/aFHkSreL4e3MajFqOLR8mst1WmjGac
	P7oVE7CKAtpjWqcXfa5mAeOmZ/nfl3oDF3Bk4bFB9wCthvqSgzgk/Lm6SM59+pvHnUAy
	R5NbCvw5tRRl2wPthnfrkhvDZVM+rXFr/rEI5AgMBjnf7aMsAVwvupwrjTfB3qDDUese
	7Z382x1pnPrxWrsOeUfKamjYPoPtxAqPmM30OSXhnc8ar9HlD9TbzLxwubyety+IXfOF
	hNO2XEtSdHdLVVmKvO65g18EnpZZ/Q4jtXW1QtiVXbCMWQz7jLFxudF91OGnmNBrZrqk
	H9Cw==
X-Gm-Message-State: APjAAAUd6urtowV81Et9NDwo05u6/A3cawEhAq7H3REnAicYK4AVxqTw
	BYxNrMnzzyhDcBgqm+HueJji46/UOPXe3IQmIcc=
X-Google-Smtp-Source: APXvYqyYNT7iiadEEHagIO89R2wXrr0zR0cbwnvgD1ZwZGmfKR4PBCtyJZZiJHa2uk5JBnitLb5xOxeeuqIu3jpL6hs=
X-Received: by 2002:a5d:8194:: with SMTP id u20mr18741598ion.193.1566159437361;
	Sun, 18 Aug 2019 13:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190814204259.120942-1-arnd@arndb.de>
	<20190814204259.120942-4-arnd@arndb.de>
	<CAHc6FU5n9rBZuH=chOdmGCwyrX-B-Euq8oFrnu3UHHKSm5A5gQ@mail.gmail.com>
	<CAK8P3a3kiyytayaSs2LB=deK0OMs42Ayn4VErhjL6eM3FTGtpw@mail.gmail.com>
In-Reply-To: <CAK8P3a3kiyytayaSs2LB=deK0OMs42Ayn4VErhjL6eM3FTGtpw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Sun, 18 Aug 2019 22:17:06 +0200
Message-ID: <CAHpGcMJ2EScNiPapyugC_fz+AEhdpKmx3VmYjTH_2me8WLxB2A@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Sun, 18 Aug 2019 20:17:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Sun, 18 Aug 2019 20:17:18 +0000 (UTC) for IP:'209.85.166.65'
	DOMAIN:'mail-io1-f65.google.com' HELO:'mail-io1-f65.google.com'
	FROM:'andreas.gruenbacher@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.65 mail-io1-f65.google.com 209.85.166.65
	mail-io1-f65.google.com <andreas.gruenbacher@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, "Darrick J. Wong" <darrick.wong@oracle.com>,
	LKML <linux-kernel@vger.kernel.org>, NeilBrown <neilb@suse.com>,
	cluster-devel <cluster-devel@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH v5 03/18] gfs2: add compat_ioctl support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Sun, 18 Aug 2019 20:17:32 +0000 (UTC)

Am So., 18. Aug. 2019 um 21:32 Uhr schrieb Arnd Bergmann <arnd@arndb.de>:
> On Fri, Aug 16, 2019 at 7:32 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> > On Wed, Aug 14, 2019 at 10:45 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > +       /* These are just misnamed, they actually get/put from/to user an int */
> > > +       switch(cmd) {
> > > +       case FS_IOC32_GETFLAGS:
> > > +               cmd = FS_IOC_GETFLAGS;
> > > +               break;
> > > +       case FS_IOC32_SETFLAGS:
> > > +               cmd = FS_IOC_SETFLAGS;
> > > +               break;
> >
> > I'd like the code to be more explicit here:
> >
> >         case FITRIM:
> >         case FS_IOC_GETFSLABEL:
> >               break;
> >         default:
> >               return -ENOIOCTLCMD;
>
> I've looked at it again: if we do this, the function actually becomes
> longer than the native gfs2_ioctl(). Should we just make a full copy then?

I don't think the length of gfs2_compat_ioctl is really an issue as
long as the function is that simple.

> static long gfs2_compat_ioctl(struct file *filp, unsigned int cmd,
> unsigned long arg)
> {
>         switch(cmd) {
>         case FS_IOC32_GETFLAGS:
>                 return gfs2_get_flags(filp, (u32 __user *)arg);
>         case FS_IOC32_SETFLAGS:
>                 return gfs2_set_flags(filp, (u32 __user *)arg);
>         case FITRIM:
>                 return gfs2_fitrim(filp, (void __user *)arg);
>         case FS_IOC_GETFSLABEL:
>                 return gfs2_getlabel(filp, (char __user *)arg);
>         }
>
>         return -ENOTTY;
> }

Don't we still need the compat_ptr conversion? That seems to be the
main point of having a compat_ioctl operation.

> > Should we feed this through the gfs2 tree?
>
> A later patch that removes the FITRIM handling from fs/compat_ioctl.c
> depends on it, so I'd like to keep everything together.

Ok, fine for me.

Thanks,
Andreas

