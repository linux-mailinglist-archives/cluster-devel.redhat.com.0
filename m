Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D2D91FB3
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Aug 2019 11:09:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77190E8CC1;
	Mon, 19 Aug 2019 09:09:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 953964C;
	Mon, 19 Aug 2019 09:09:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3AEA53CBF;
	Mon, 19 Aug 2019 09:09:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7J99VY0000573 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Aug 2019 05:09:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3E62E1DF; Mon, 19 Aug 2019 09:09:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD8D31C0;
	Mon, 19 Aug 2019 09:09:28 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04EC5E8CC1;
	Mon, 19 Aug 2019 09:09:28 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id j15so1073595qtl.13;
	Mon, 19 Aug 2019 02:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rczbmYNDQXzrrKbji3E8GHKh4iXow7Hl/uO3TZ6Tc+k=;
	b=Xv9y8yTk4IpzThsfXtCsfobjEZz0BVxu7Yklp4AoOmj9QzuFud1+97xSAawQxMIgqU
	xOkyAKkgXKjjIPB2dV/ieqZ912A62ZT1RhEDGkCTY1zpHRpQaqCeZhFALm2h3yeK3dPG
	161Mrl1eYY/GoyS1bmlxC5uSSJEXOflbZ3fD5QYCuMbKnDTCPLsgFyXERqSVWqWfahs3
	2UiqtNCZjfPo7Fdwtzx1cRgqutm+an1BN6ps+uBZqtkHwfkE7nx41mTl6AEURzDwrIqY
	AurjJgHOQ4z2aa5kIwfQynaA9HKGLaIpxuvWW7BU9lK9GmBB2JyNMyJHGxW2fG6wMCNR
	yJUw==
X-Gm-Message-State: APjAAAVh3iPhozYOWNyspREjIgMcjN6DajxGj4ouubhqdFQOKWNbGuBN
	PV4KVDxAYQ3YwujLYwFU9PzpT/ghWeuT9bnZMN0=
X-Google-Smtp-Source: APXvYqzVXYNfh7BL03PgbmX2PaeKvfUoSaxXiKUu5Yi3ewEtq9YKOS5Vp8fOpVAr65J8GcHJZdmWGo8kYp4Xu1Bou1E=
X-Received: by 2002:ad4:45c7:: with SMTP id v7mr9673895qvt.63.1566205767031;
	Mon, 19 Aug 2019 02:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190814204259.120942-1-arnd@arndb.de>
	<20190814204259.120942-4-arnd@arndb.de>
	<CAHc6FU5n9rBZuH=chOdmGCwyrX-B-Euq8oFrnu3UHHKSm5A5gQ@mail.gmail.com>
	<CAK8P3a3kiyytayaSs2LB=deK0OMs42Ayn4VErhjL6eM3FTGtpw@mail.gmail.com>
	<CAHpGcMJ2EScNiPapyugC_fz+AEhdpKmx3VmYjTH_2me8WLxB2A@mail.gmail.com>
In-Reply-To: <CAHpGcMJ2EScNiPapyugC_fz+AEhdpKmx3VmYjTH_2me8WLxB2A@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 19 Aug 2019 11:09:11 +0200
Message-ID: <CAK8P3a3iOnsW43qt9yjD8Tyv800svBZF8ZEnqvk-F56vv5yqtw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 19 Aug 2019 09:09:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Mon, 19 Aug 2019 09:09:28 +0000 (UTC) for IP:'209.85.160.196'
	DOMAIN:'mail-qt1-f196.google.com'
	HELO:'mail-qt1-f196.google.com' FROM:'arndbergmann@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.48  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.160.196 mail-qt1-f196.google.com 209.85.160.196
	mail-qt1-f196.google.com <arndbergmann@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Content-Transfer-Encoding: 8bit
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7J99VY0000573
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 19 Aug 2019 09:09:37 +0000 (UTC)

On Sun, Aug 18, 2019 at 10:17 PM Andreas Grünbacher
<andreas.gruenbacher@gmail.com> wrote:
> Am So., 18. Aug. 2019 um 21:32 Uhr schrieb Arnd Bergmann <arnd@arndb.de>:
> > On Fri, Aug 16, 2019 at 7:32 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> > > On Wed, Aug 14, 2019 at 10:45 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > +       /* These are just misnamed, they actually get/put from/to user an int */
> > > > +       switch(cmd) {
> > > > +       case FS_IOC32_GETFLAGS:
> > > > +               cmd = FS_IOC_GETFLAGS;
> > > > +               break;
> > > > +       case FS_IOC32_SETFLAGS:
> > > > +               cmd = FS_IOC_SETFLAGS;
> > > > +               break;
> > >
> > > I'd like the code to be more explicit here:
> > >
> > >         case FITRIM:
> > >         case FS_IOC_GETFSLABEL:
> > >               break;
> > >         default:
> > >               return -ENOIOCTLCMD;
> >
> > I've looked at it again: if we do this, the function actually becomes
> > longer than the native gfs2_ioctl(). Should we just make a full copy then?
>
> I don't think the length of gfs2_compat_ioctl is really an issue as
> long as the function is that simple.

True. The most important goal should just be to make it easy to
add the correct handler the next time another command is added
to the ioctl function.

Just let me know which version you want for that:

1. my original patch
2. the version from your reply
3. my version below with compat_ptr() added
4. ...

> > static long gfs2_compat_ioctl(struct file *filp, unsigned int cmd,
> > unsigned long arg)
> > {
> >         switch(cmd) {
> >         case FS_IOC32_GETFLAGS:
> >                 return gfs2_get_flags(filp, (u32 __user *)arg);
> >         case FS_IOC32_SETFLAGS:
> >                 return gfs2_set_flags(filp, (u32 __user *)arg);
> >         case FITRIM:
> >                 return gfs2_fitrim(filp, (void __user *)arg);
> >         case FS_IOC_GETFSLABEL:
> >                 return gfs2_getlabel(filp, (char __user *)arg);
> >         }
> >
> >         return -ENOTTY;
> > }
>
> Don't we still need the compat_ptr conversion? That seems to be the
> main point of having a compat_ioctl operation.

Right, of course. Fixed now in my tree.

         Arnd

