Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C2192082
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Aug 2019 11:38:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A782307D965;
	Mon, 19 Aug 2019 09:38:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 750561E8;
	Mon, 19 Aug 2019 09:38:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00EB02551C;
	Mon, 19 Aug 2019 09:38:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7J9cBoT001347 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Aug 2019 05:38:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B825918AB6; Mon, 19 Aug 2019 09:38:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFFC618B4A
	for <cluster-devel@redhat.com>; Mon, 19 Aug 2019 09:38:09 +0000 (UTC)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
	[209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 44DBFCAA7F
	for <cluster-devel@redhat.com>; Mon, 19 Aug 2019 09:38:09 +0000 (UTC)
Received: by mail-ot1-f72.google.com with SMTP id 88so1983681otc.19
	for <cluster-devel@redhat.com>; Mon, 19 Aug 2019 02:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=60rRVige5JMKARBYqg7mGnVhhfClBN8pbmqimK57PFo=;
	b=pxspRXVeLjjUqiwyACKz8z0CM012nQCi8om7wsDvbI9b23Jor5JiLggVAxMFIupqfo
	ZgwxhbNI+bDWrvDRzEGfC8+pQA0I4ZO9w9J7muNtJHQUXqWZ11WBozig/35t/ZAJZsru
	DWRZUyuavPUNGzFXDeifuT1OxrWyL2xYScDLGnRy/gVT1Y5+Gw5YYd83lN5EyNz8AkLz
	cjMZYA54f9cchT17MoO1YdJqpZP23a0ApOqgKZ4fukW8mNWcMyChWVcE42IfCpONLX1C
	SmMN/GgzEW7nsZwwYhu9M8YuwO76C/un5gtpFKIkPZuFxg4KOLKmIV5ByuQYkyZ+i3CD
	dnJg==
X-Gm-Message-State: APjAAAXFgP3OWeTH7hh68DuQgtBgiYuXelL2mbPG8FZfMts/oOinEEOO
	VYkpV1Pt25v2nRA6G0gL9S4tZRVf6Hypt9zUBpEOGMMJFYlblgyFO9POCaNIjmoaPDAMvdtG8tZ
	1S9zVLzhl3pOHodW1uwgAl0pL/Q4B/bkniw7a+Q==
X-Received: by 2002:a05:6830:22f4:: with SMTP id
	t20mr16486572otc.58.1566207488755; 
	Mon, 19 Aug 2019 02:38:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyu7VWpm/ykQLhkCx5IuTRbTXVXAVHJxIU8g8KdVoHhsAoxNxwhFjKCfa+WWEcSsyKU+NovpXcf+CMXuqXBX3c=
X-Received: by 2002:a05:6830:22f4:: with SMTP id
	t20mr16486561otc.58.1566207488604; 
	Mon, 19 Aug 2019 02:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190814204259.120942-1-arnd@arndb.de>
	<20190814204259.120942-4-arnd@arndb.de>
	<CAHc6FU5n9rBZuH=chOdmGCwyrX-B-Euq8oFrnu3UHHKSm5A5gQ@mail.gmail.com>
	<CAK8P3a3kiyytayaSs2LB=deK0OMs42Ayn4VErhjL6eM3FTGtpw@mail.gmail.com>
	<CAHpGcMJ2EScNiPapyugC_fz+AEhdpKmx3VmYjTH_2me8WLxB2A@mail.gmail.com>
	<CAK8P3a3iOnsW43qt9yjD8Tyv800svBZF8ZEnqvk-F56vv5yqtw@mail.gmail.com>
In-Reply-To: <CAK8P3a3iOnsW43qt9yjD8Tyv800svBZF8ZEnqvk-F56vv5yqtw@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 19 Aug 2019 11:37:57 +0200
Message-ID: <CAHc6FU77RO3YJgc3mVoRtec6Gmb=TYY46zL3BFennxDUfogm0A@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Content-Transfer-Encoding: 8bit
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7J9cBoT001347
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, "Darrick J. Wong" <darrick.wong@oracle.com>,
	=?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Mon, 19 Aug 2019 09:38:16 +0000 (UTC)

On Mon, Aug 19, 2019 at 11:09 AM Arnd Bergmann <arnd@arndb.de> wrote:
> On Sun, Aug 18, 2019 at 10:17 PM Andreas Grünbacher
> <andreas.gruenbacher@gmail.com> wrote:
> > Am So., 18. Aug. 2019 um 21:32 Uhr schrieb Arnd Bergmann <arnd@arndb.de>:
> > > On Fri, Aug 16, 2019 at 7:32 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> > > > On Wed, Aug 14, 2019 at 10:45 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > +       /* These are just misnamed, they actually get/put from/to user an int */
> > > > > +       switch(cmd) {
> > > > > +       case FS_IOC32_GETFLAGS:
> > > > > +               cmd = FS_IOC_GETFLAGS;
> > > > > +               break;
> > > > > +       case FS_IOC32_SETFLAGS:
> > > > > +               cmd = FS_IOC_SETFLAGS;
> > > > > +               break;
> > > >
> > > > I'd like the code to be more explicit here:
> > > >
> > > >         case FITRIM:
> > > >         case FS_IOC_GETFSLABEL:
> > > >               break;
> > > >         default:
> > > >               return -ENOIOCTLCMD;
> > >
> > > I've looked at it again: if we do this, the function actually becomes
> > > longer than the native gfs2_ioctl(). Should we just make a full copy then?
> >
> > I don't think the length of gfs2_compat_ioctl is really an issue as
> > long as the function is that simple.
>
> True. The most important goal should just be to make it easy to
> add the correct handler the next time another command is added
> to the ioctl function.
>
> Just let me know which version you want for that:
>
> 1. my original patch
> 2. the version from your reply

That one, please.

> 3. my version below with compat_ptr() added
> 4. ...
>
> > > static long gfs2_compat_ioctl(struct file *filp, unsigned int cmd,
> > > unsigned long arg)
> > > {
> > >         switch(cmd) {
> > >         case FS_IOC32_GETFLAGS:
> > >                 return gfs2_get_flags(filp, (u32 __user *)arg);
> > >         case FS_IOC32_SETFLAGS:
> > >                 return gfs2_set_flags(filp, (u32 __user *)arg);
> > >         case FITRIM:
> > >                 return gfs2_fitrim(filp, (void __user *)arg);
> > >         case FS_IOC_GETFSLABEL:
> > >                 return gfs2_getlabel(filp, (char __user *)arg);
> > >         }
> > >
> > >         return -ENOTTY;
> > > }
> >
> > Don't we still need the compat_ptr conversion? That seems to be the
> > main point of having a compat_ioctl operation.
>
> Right, of course. Fixed now in my tree.
>
>          Arnd

Thanks,
Andreas

